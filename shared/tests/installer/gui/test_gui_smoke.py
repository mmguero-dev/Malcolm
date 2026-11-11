#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Smoke tests for the GUI installer: every module imports, and every config item gets a widget."""

import importlib
import pkgutil

import pytest

from gui_requirements import require_gui

require_gui()

import customtkinter  # noqa: E402  (only importable once require_gui() has passed)

from scripts.installer.core.malcolm_config import MalcolmConfig
from scripts.malcolm_constants import PROFILE_HEDGEHOG, PROFILE_MALCOLM
from scripts.installer.configs.constants.configuration_item_keys import KEY_CONFIG_ITEM_MALCOLM_PROFILE


def test_every_gui_module_imports():
    import scripts.installer.ui.gui as gui_pkg

    failed = {}
    for module_info in pkgutil.walk_packages(gui_pkg.__path__, prefix="scripts.installer.ui.gui."):
        try:
            importlib.import_module(module_info.name)
        except Exception as e:  # report them all at once
            failed[module_info.name] = repr(e)
    assert failed == {}


@pytest.fixture
def root():
    window = customtkinter.CTk()
    window.withdraw()
    yield window
    window.destroy()


@pytest.mark.parametrize("profile", [PROFILE_MALCOLM, PROFILE_HEDGEHOG])
def test_every_config_item_builds_a_widget(root, profile):
    from scripts.installer.ui.gui.widgets.config_item_widget import create_config_item_widget

    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, profile)
    frame = customtkinter.CTkFrame(root)
    missing = []
    for key, item in cfg.get_all_config_items().items():
        if create_config_item_widget(frame, key, item, cfg) is None:
            missing.append(key)
    root.update_idletasks()
    # an item with no widget can't be set from the GUI at all
    assert missing == []
