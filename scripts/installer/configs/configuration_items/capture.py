#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright (c) 2025 Battelle Energy Alliance, LLC.  All rights reserved.

"""
Live traffic capture configuration items for Malcolm installer.

This module contains all configuration items related to live traffic capture settings,
including network interface configuration, capture filters, and capture methods.
"""

from scripts.malcolm_constants import DATABASE_MODE_LABELS, DatabaseMode, WidgetType
from scripts.malcolm_utils import get_hostname_without_domain

from scripts.installer.core.config_item import ConfigItem
from scripts.installer.configs.constants.configuration_item_keys import (
    KEY_CONFIG_ITEM_CAPTURE_STATS,
    KEY_CONFIG_ITEM_LIVE_ARKIME,
    KEY_CONFIG_ITEM_LIVE_ARKIME_NODE_HOST,
    KEY_CONFIG_ITEM_LIVE_SURICATA,
    KEY_CONFIG_ITEM_LIVE_ZEEK,
    KEY_CONFIG_ITEM_PCAP_FILTER,
    KEY_CONFIG_ITEM_PCAP_IFACE,
    KEY_CONFIG_ITEM_PCAP_NETSNIFF,
    KEY_CONFIG_ITEM_PCAP_NODE_NAME,
    KEY_CONFIG_ITEM_PCAP_TCPDUMP,
    KEY_CONFIG_ITEM_TWEAK_IFACE,
)

CONFIG_ITEM_PCAP_IFACE = ConfigItem(
    key=KEY_CONFIG_ITEM_PCAP_IFACE,
    label="Capture Interface(s)",
    default_value="",
    validator=lambda x: isinstance(x, str),
    question="Capture interface(s) (comma-separated)",
    widget_type=WidgetType.TEXT,
)

CONFIG_ITEM_PCAP_FILTER = ConfigItem(
    key=KEY_CONFIG_ITEM_PCAP_FILTER,
    label="Capture Filter",
    default_value="",
    validator=lambda x: isinstance(x, str),
    question="Capture filter (tcpdump-like filter expression; blank to capture all traffic)",
    accept_blank=True,
    widget_type=WidgetType.TEXT,
)

CONFIG_ITEM_TWEAK_IFACE = ConfigItem(
    key=KEY_CONFIG_ITEM_TWEAK_IFACE,
    label="Optimize Interface Settings for Capture",
    default_value=True,
    validator=lambda x: isinstance(x, bool),
    question="Disable capture interface hardware offloading and adjust ring buffer sizes?",
    widget_type=WidgetType.CHECKBOX,
)

# For CAPTURE_STATS, we'll use SURICATA_STATS_ENABLED since that seems to be its primary equivalent
# This also writes to another env var SURICATA_STATS_EVE_ENABLED
CONFIG_ITEM_CAPTURE_STATS = ConfigItem(
    key=KEY_CONFIG_ITEM_CAPTURE_STATS,
    label="Gather Traffic Capture Statistics",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question="Enable live packet capture statistics for Zeek and/or Suricata?",
    widget_type=WidgetType.CHECKBOX,
)

CONFIG_ITEM_LIVE_ARKIME = ConfigItem(
    key=KEY_CONFIG_ITEM_LIVE_ARKIME,
    label="Capture Live Traffic with Arkime",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question=f"Capture live network traffic with Arkime capture?",
    widget_type=WidgetType.CHECKBOX,
)

# Default value handled in MalcolmConfig based on LIVE_ARKIME and PCAP_NODE_NAME
CONFIG_ITEM_LIVE_ARKIME_NODE_HOST = ConfigItem(
    key=KEY_CONFIG_ITEM_LIVE_ARKIME_NODE_HOST,
    label="Arkime Node Host",
    default_value=get_hostname_without_domain(),
    validator=lambda x: isinstance(x, str),
    question="Node hostname or IP address to associate with live network traffic observed by Arkime capture",
    widget_type=WidgetType.TEXT,
)

CONFIG_ITEM_PCAP_NETSNIFF = ConfigItem(
    key=KEY_CONFIG_ITEM_PCAP_NETSNIFF,
    label="Capture Live Traffic with netsniff-ng",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question="Capture live network traffic to PCAP with netsniff-ng?",
    widget_type=WidgetType.CHECKBOX,
)

CONFIG_ITEM_PCAP_TCPDUMP = ConfigItem(
    key=KEY_CONFIG_ITEM_PCAP_TCPDUMP,
    label="Capture Live Traffic with tcpdump",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question="Capture live network traffic to PCAP with tcpdump?",
    widget_type=WidgetType.CHECKBOX,
)

CONFIG_ITEM_LIVE_ZEEK = ConfigItem(
    key=KEY_CONFIG_ITEM_LIVE_ZEEK,
    label="Analyze Live Traffic with Zeek",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question="Analyze live network traffic with Zeek?",
    widget_type=WidgetType.CHECKBOX,
)

CONFIG_ITEM_LIVE_SURICATA = ConfigItem(
    key=KEY_CONFIG_ITEM_LIVE_SURICATA,
    label="Analyze Live Traffic with Suricata",
    default_value=False,
    validator=lambda x: isinstance(x, bool),
    question="Analyze live network traffic with Suricata?",
    widget_type=WidgetType.CHECKBOX,
)

CONFIG_ITEM_PCAP_NODE_NAME = ConfigItem(
    key=KEY_CONFIG_ITEM_PCAP_NODE_NAME,
    label="Network Traffic Node Name",
    default_value=get_hostname_without_domain(),
    validator=lambda x: isinstance(x, str),
    question="Node name to associate with network traffic metadata",
    widget_type=WidgetType.TEXT,
)


def get_capture_config_item_dict():
    """Get all ConfigItem objects from this module.

    Returns:
        Dict mapping configuration key strings to their ConfigItem objects
    """
    config_items = {}
    # Iterate over globals to find all defined ConfigItem objects in this module
    for key_name, key_value in globals().items():
        # Check if this is a ConfigItem object
        if isinstance(key_value, ConfigItem):
            # Store the entire ConfigItem object with its key as the dictionary key
            config_items[key_value.key] = key_value
    return config_items


# A dictionary mapping configuration keys to their ConfigItem objects, created once at module load.
ALL_CAPTURE_CONFIG_ITEMS_DICT = get_capture_config_item_dict()

if __name__ == "__main__":
    # print(globals().items())
    print(ALL_CAPTURE_CONFIG_ITEMS_DICT.keys())
