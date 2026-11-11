#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Menu tree checks: every setting is reachable from the main menu, and shared settings show for both profiles."""

import itertools

import pytest

from scripts.installer.core.malcolm_config import MalcolmConfig
from scripts.installer.configs.constants.constants import MAIN_MENU_ITEM_KEYS
from scripts.installer.configs.constants.configuration_item_keys import (
    KEY_CONFIG_ITEM_ARKIME_WISE_URL,
    KEY_CONFIG_ITEM_AUTO_ARKIME,
    KEY_CONFIG_ITEM_AUTO_SURICATA,
    KEY_CONFIG_ITEM_AUTO_ZEEK,
    KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC,
    KEY_CONFIG_ITEM_FILE_CARVE_MODE,
    KEY_CONFIG_ITEM_LIVE_SURICATA,
    KEY_CONFIG_ITEM_LIVE_ZEEK,
    KEY_CONFIG_ITEM_MALCOLM_ICS,
    KEY_CONFIG_ITEM_MALCOLM_PROFILE,
    KEY_CONFIG_ITEM_PCAP_NODE_NAME,
    KEY_CONFIG_ITEM_SURICATA_DISABLE_SIDS,
    KEY_CONFIG_ITEM_SURICATA_RULE_UPDATE,
    KEY_CONFIG_ITEM_ZEEK_PULL_INTELLIGENCE_FEEDS,
)
from scripts.installer.configs.constants.menu_item_keys import KEY_MENU_ITEM_ANALYSIS_ZEEK
from scripts.malcolm_constants import PROFILE_HEDGEHOG, PROFILE_MALCOLM


def _ancestors(cfg, key):
    """ui_parent chain of key (config items and menu items), nearest first."""
    chain, seen = [], {key}
    item = cfg.get_item(key)
    parent = item.ui_parent if item else None
    while parent and parent not in seen:
        seen.add(parent)
        chain.append(parent)
        node = cfg.get_item(parent) or cfg.get_menu_item(parent)
        parent = node.ui_parent if node else None
    return chain


def _shown(cfg, key):
    return cfg.is_menu_item_visible(key) if cfg.get_menu_item(key) else cfg.is_item_visible(key)


def _configs():
    for profile, live in itertools.product((PROFILE_MALCOLM, PROFILE_HEDGEHOG), (False, True)):
        cfg = MalcolmConfig()
        cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, profile)
        cfg.set_value(KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC, live)
        yield f"{profile}/live={live}", cfg


def test_every_setting_hangs_off_the_main_menu():
    cfg = MalcolmConfig()
    roots = set(MAIN_MENU_ITEM_KEYS)
    stray = [
        key
        for key in cfg.get_all_config_items()
        if key not in roots and not (set(_ancestors(cfg, key)) & roots)
    ]
    assert stray == [], f"settings no menu leads to: {stray}"


@pytest.mark.parametrize("label, cfg", list(_configs()))
def test_visible_settings_have_shown_ancestors(label, cfg):
    hidden_path = {
        key: [a for a in _ancestors(cfg, key) if not _shown(cfg, a)]
        for key in cfg.get_all_config_items()
        if cfg.is_item_visible(key)
    }
    assert {k: v for k, v in hidden_path.items() if v} == {}, label


def test_shared_analysis_settings_show_for_hedgehog_live_capture():
    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, PROFILE_HEDGEHOG)
    cfg.set_value(KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC, True)
    assert cfg.get_value(KEY_CONFIG_ITEM_LIVE_ZEEK) and cfg.get_value(KEY_CONFIG_ITEM_LIVE_SURICATA)
    for key in (
        KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC,
        KEY_CONFIG_ITEM_PCAP_NODE_NAME,
        KEY_CONFIG_ITEM_ARKIME_WISE_URL,
        KEY_CONFIG_ITEM_FILE_CARVE_MODE,
        KEY_CONFIG_ITEM_MALCOLM_ICS,
        KEY_CONFIG_ITEM_ZEEK_PULL_INTELLIGENCE_FEEDS,
        KEY_CONFIG_ITEM_SURICATA_RULE_UPDATE,
        KEY_CONFIG_ITEM_SURICATA_DISABLE_SIDS,
    ):
        assert cfg.is_item_visible(key), key
    # uploaded-PCAP auto-analysis is Malcolm-only
    for key in (KEY_CONFIG_ITEM_AUTO_ARKIME, KEY_CONFIG_ITEM_AUTO_ZEEK, KEY_CONFIG_ITEM_AUTO_SURICATA):
        assert not cfg.is_item_visible(key), key


def test_hidden_auto_analysis_does_not_show_engine_settings_on_hedgehog():
    # AUTO_ZEEK still holds its default (on) when hidden; it mustn't count for Hedgehog
    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, PROFILE_HEDGEHOG)
    cfg.set_value(KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC, False)
    assert cfg.get_value(KEY_CONFIG_ITEM_AUTO_ZEEK)
    assert not cfg.is_item_visible(KEY_CONFIG_ITEM_FILE_CARVE_MODE)
    # and with nothing under it visible, the Zeek menu node hides itself
    assert not cfg.is_menu_item_visible(KEY_MENU_ITEM_ANALYSIS_ZEEK)


def test_visibility_changes_do_not_fire_value_observers():
    cfg = MalcolmConfig()
    value_calls, visibility_calls = [], []
    cfg.observe(KEY_CONFIG_ITEM_FILE_CARVE_MODE, value_calls.append)
    cfg.observe_visibility(KEY_CONFIG_ITEM_FILE_CARVE_MODE, visibility_calls.append)
    cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, PROFILE_HEDGEHOG)  # hides file carving (no live capture)
    assert visibility_calls == [False]
    assert value_calls == []


@pytest.mark.parametrize("mode", ["disabled", "local", "remote"])
def test_hedgehog_site_name_sits_directly_in_the_netbox_menu(mode):
    from scripts.installer.configs.constants.configuration_item_keys import KEY_CONFIG_ITEM_NETBOX_MODE, KEY_CONFIG_ITEM_NETBOX_SITE_NAME
    from scripts.installer.configs.constants.menu_item_keys import KEY_MENU_ITEM_ENRICHMENT_NETBOX

    cfg = MalcolmConfig()
    cfg.set_value(KEY_CONFIG_ITEM_NETBOX_MODE, mode)
    cfg.set_value(KEY_CONFIG_ITEM_MALCOLM_PROFILE, PROFILE_HEDGEHOG)
    assert cfg.get_item(KEY_CONFIG_ITEM_NETBOX_SITE_NAME).ui_parent == KEY_MENU_ITEM_ENRICHMENT_NETBOX
    assert cfg.is_item_visible(KEY_CONFIG_ITEM_NETBOX_SITE_NAME)
    assert cfg.is_menu_item_visible(KEY_MENU_ITEM_ENRICHMENT_NETBOX)


def test_capture_settings_live_under_analysis():
    from scripts.installer.configs.constants.configuration_item_keys import KEY_CONFIG_ITEM_EXTRA_TAGS
    from scripts.installer.configs.constants.menu_item_keys import KEY_MENU_ITEM_ANALYSIS

    cfg = MalcolmConfig()
    # node name and extra tags label live and uploaded traffic alike; live capture's own subtree carries the rest
    for key in (KEY_CONFIG_ITEM_PCAP_NODE_NAME, KEY_CONFIG_ITEM_EXTRA_TAGS, KEY_CONFIG_ITEM_CAPTURE_LIVE_NETWORK_TRAFFIC):
        assert cfg.get_item(key).ui_parent == KEY_MENU_ITEM_ANALYSIS, key
