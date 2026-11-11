#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""The GUI config-ingest dialog decides whether to load existing .env files; install.py loads them
with every other source in one bulk load (load_configuration_sources), as the TUI/DUI path does.

This exercises the dialog's decision logic without a display: when the GUI libraries aren't
installed, stand-ins are put in place just for the import.
"""

import importlib
import sys
import types

import pytest

from scripts.installer.core.malcolm_config import MalcolmConfig


def _stand_in_module(name):
    module = types.ModuleType(name)
    module.__getattr__ = lambda attr: type(attr, (), {})  # any class/attribute the import touches
    return module


@pytest.fixture
def ingest_module(monkeypatch):
    for name in ("customtkinter", "tkinter", "tkinter.filedialog"):
        try:
            importlib.import_module(name)
        except Exception:
            monkeypatch.setitem(sys.modules, name, _stand_in_module(name))
    if "tkinter.filedialog" in sys.modules and not hasattr(sys.modules["tkinter"], "filedialog"):
        monkeypatch.setattr(sys.modules["tkinter"], "filedialog", sys.modules["tkinter.filedialog"], raising=False)
    for name in ("scripts.installer.ui.gui.components.dialog", "scripts.installer.ui.gui.dialogs.config_ingest_dialog"):
        monkeypatch.delitem(sys.modules, name, raising=False)
    module = importlib.import_module("scripts.installer.ui.gui.dialogs.config_ingest_dialog")
    monkeypatch.setattr(module, "show_message_dialog", lambda *a, **k: None)
    yield module
    for name in ("scripts.installer.ui.gui.components.dialog", "scripts.installer.ui.gui.dialogs.config_ingest_dialog"):
        sys.modules.pop(name, None)


def _config_dir(tmp_path, with_env=True):
    (tmp_path / "netbox-common.env.example").write_text("NETBOX_MODE=disabled\n")
    if with_env:
        (tmp_path / "netbox-common.env").write_text("NETBOX_MODE=remote\n")
    return str(tmp_path)


@pytest.mark.parametrize("user_says_load", [True, False])
def test_dialog_records_the_choice_without_loading(ingest_module, monkeypatch, tmp_path, user_says_load):
    monkeypatch.setattr(ingest_module, "show_confirmation_dialog", lambda *a, **k: user_says_load)
    cfg = MalcolmConfig()
    before = cfg.get_value("netboxMode")
    dialog = ingest_module.ConfigIngestDialog(None, cfg, _config_dir(tmp_path))
    assert dialog._validate_and_load_config(None, str(tmp_path)) == (True, str(tmp_path), str(tmp_path))
    assert dialog.env_dir_to_load == (str(tmp_path) if user_says_load else None)
    assert cfg.get_value("netboxMode") == before  # nothing loaded yet


def test_no_env_files_means_nothing_to_load(ingest_module, monkeypatch, tmp_path):
    monkeypatch.setattr(ingest_module, "show_confirmation_dialog", lambda *a, **k: pytest.fail("shouldn't ask"))
    dialog = ingest_module.ConfigIngestDialog(None, MalcolmConfig(), str(tmp_path))
    assert dialog._validate_and_load_config(None, _config_dir(tmp_path, with_env=False))[0]
    assert dialog.env_dir_to_load is None


def test_directory_without_templates_is_rejected(ingest_module, tmp_path):
    dialog = ingest_module.ConfigIngestDialog(None, MalcolmConfig(), str(tmp_path))
    assert dialog._validate_and_load_config(None, str(tmp_path)) == (False, None, None)
    assert dialog.env_dir_to_load is None
