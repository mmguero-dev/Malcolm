#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Skip a GUI test module cleanly when it can't run here."""

import importlib.util
import os
import sys

import pytest


def gui_unavailable_reason():
    """Why GUI tests can't run in this environment, or None if they can."""
    for module_name in ("tkinter", "customtkinter", "PIL"):
        if importlib.util.find_spec(module_name) is None:
            return f"{module_name} is not installed (see shared/tests/requirements-gui.txt; tkinter comes from the OS)"
    if sys.platform.startswith("linux") and not (os.environ.get("DISPLAY") or os.environ.get("WAYLAND_DISPLAY")):
        return "no display (run under xvfb-run in a headless environment)"
    return None


def require_gui():
    """Call at the top of a GUI test module, before importing anything that needs the GUI libraries."""
    reason = gui_unavailable_reason()
    if reason:
        pytest.skip(f"GUI installer tests skipped: {reason}", allow_module_level=True)
