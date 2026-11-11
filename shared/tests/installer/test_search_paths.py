#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Search output has to account for menu items: paths name every menu on the way, and
settings inside collapsed TUI menus aren't reported as on screen."""

import re

from scripts.installer.core.install_context import InstallContext
from scripts.installer.core.malcolm_config import MalcolmConfig
from scripts.installer.configs.constants.constants import MAIN_MENU_ITEM_KEYS
from scripts.installer.configs.constants.configuration_item_keys import (
    KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC,
    KEY_CONFIG_ITEM_FILE_CARVE_MODE,
    KEY_CONFIG_ITEM_FILE_PRESERVE_MODE,
    KEY_CONFIG_ITEM_PCAP_IFACE,
)
from scripts.installer.configs.constants.menu_item_keys import KEY_MENU_ITEM_ANALYSIS, KEY_MENU_ITEM_ANALYSIS_ZEEK
from scripts.installer.ui.shared.search_utils import (
    find_gating_ancestor,
    format_menu_path,
    format_search_results_text,
)
from scripts.installer.ui.tui.configuration_menu import ConfigurationMenu
from scripts.malcolm_common import UserInterfaceMode


def test_menu_path_names_every_menu_by_label():
    cfg = MalcolmConfig()
    assert format_menu_path(cfg, KEY_CONFIG_ITEM_PCAP_IFACE) == (
        "Main › Analysis Settings › Capture Live Network Traffic Settings"
    )
    assert format_menu_path(cfg, KEY_CONFIG_ITEM_FILE_PRESERVE_MODE) == (
        "Main › Analysis Settings › Zeek Settings › File Extraction Settings"
    )


def test_gating_ancestor_is_a_config_item():
    cfg = MalcolmConfig()
    # live capture is off, so the interface setting waits on it (not on the Analysis menu)
    assert find_gating_ancestor(cfg, KEY_CONFIG_ITEM_PCAP_IFACE) == KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC


def _tui_search(cfg, term):
    menu = ConfigurationMenu(
        cfg, InstallContext(), main_menu_keys=MAIN_MENU_ITEM_KEYS, ui_mode=UserInterfaceMode.InteractionInput
    )
    menu.build_menu()
    text = format_search_results_text(cfg, term, displayed_keys=menu.displayed_keys, colorize=False)
    return [line for line in text.splitlines() if term in line and not line.startswith("---")]


def test_tui_search_points_into_collapsed_menus():
    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_FILE_CARVE_MODE, "all")
    cfg.toggle_menu_item_expanded(KEY_MENU_ITEM_ANALYSIS_ZEEK)  # inner menu open, Analysis still collapsed
    (row,) = _tui_search(cfg, "File Preservation")
    assert "visible" not in row
    assert re.search(r"Analysis Settings -> Zeek Settings\s*$", row)


def test_tui_search_numbers_settings_once_their_menus_are_open():
    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_FILE_CARVE_MODE, "all")
    cfg.toggle_menu_item_expanded(KEY_MENU_ITEM_ANALYSIS)
    cfg.toggle_menu_item_expanded(KEY_MENU_ITEM_ANALYSIS_ZEEK)
    (row,) = _tui_search(cfg, "File Preservation")
    assert re.match(r"\s*\d+\.?\s+File Preservation\s+visible", row)
