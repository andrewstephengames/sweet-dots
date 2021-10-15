# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

mod = "mod4"
alt = "mod1"
terminal = "alacritty"

keys = [
     Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
     # Move windows between left/right columns or move up/down in current stack.
     # Moving out of range in Columns layout will create new column.
     Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
         desc="Move window to the left"),
     Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
         desc="Move window to the right"),
     Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
         desc="Move window down"),
     Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
 
     # Grow windows. If current window is on the edge of screen and direction
     # will be to screen edge - window would shrink.
     Key([mod], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "g", lazy.spawn("flameshot gui"), desc="Launch Flameshot"),
    Key([mod, "shift"], "s", lazy.spawn("flameshot full -p /home/andrew/Screenshots"), desc="Save fullscreen screenshot"),
    Key([mod], "s", lazy.spawn("flameshot full -c"), desc="Copy fullscreen screenshot to the clipboard"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show drun"),
        desc="Spawn a Rofi Run Prompt"),
    Key([mod], "e", lazy.spawn("rofi -show emoji -modi emoji"),
        desc="Spawn Rofi Emoji"),
    Key([], "Page_Up", lazy.spawn("pamixer -i 5"),
        desc="Increase Volume"),
    Key([], "Page_Down", lazy.spawn("pamixer -d 5"),
        desc="Decrease Volume"),
    Key([], "Pause", lazy.spawn("pamixer -t"),
        desc="Mute Volume"),
    Key(["control"], "Escape", lazy.spawn("xdotool mousemove 1904 1034 click 1 mousemove restore"),
        desc="Hide Downloads in Brave"),
    Key([mod], "Escape", lazy.spawn("xkill"),
        desc="Kill *window"),
    Key(["control", "shift"], "g", lazy.spawn("xdotool mousemove 0 0"),
        desc="Move mouse out of your way"),
    Key(["control", "shift"], "Tab", lazy.spawn("firefox https://classroom.google.com/u/1/"),
        desc="Launch Google Classroom"),
    Key([mod], "t", lazy.spawn("scripts/shell/autompv.sh"),
        desc="Launch mpv with most recent clipboard entry"),
    Key(["control", "shift"], "k", lazy.spawn("scripts/shell/kdeconnect-qtile.sh"),
        desc="Launch host filesystem with a keybinding"),
    Key([mod], "w", lazy.spawn("firefox"),
        desc="Launch Firefox"),
    Key([mod], "f", lazy.spawn("pcmanfm"),
        desc="Launch PCManFM"),
    Key([mod], "m", lazy.spawn("scripts/shell/mcpe"),
        desc="Launch MCPE"),
    Key([mod], "o", lazy.window.toggle_minimize(),
        desc="Toggle minimize *window"),
    Key([mod], "x", lazy.spawn("scripts/shell/cpu"),
        desc="Send notification with top 5 most intensive processes"),
    Key(["control", "shift"], "space", lazy.spawn("mpvc -p"),
        desc="Pause mpv music"),
    Key(["control", "shift"], "z", lazy.spawn("mpvc prev"),
        desc="Prev mpv music"),
    Key(["control", "shift"], "x", lazy.spawn("mpvc next"),
        desc="Next mpv music"),
    Key([mod], "n", lazy.spawn("dunstctl history-pop"), 
        desc="Show most recent notification in history"),
    Key([mod, "shift"], "n", lazy.spawn("dunstctl close-all"), 
        desc="Close notifications on the screen"),
    Key([mod], "c", lazy.spawn("alacritty -e calc"),
        desc="Launch calc"),
]

group_names = [("", {'layout': 'max'}),
               ("", {'layout': 'columns', 'matches':[Match(wm_class=["spacefm"])]}),
               ("", {'layout': 'max'}),
               ("", {'layout': 'tile', 'matches':[Match(wm_class=["deadbeef"])]}),
               ("", {'layout': 'columns', 'matches':[Match(wm_class=["fsearch"])]}),
               ("", {'layout': 'max', 'matches':[Match(wm_class=["multimc", "Minecraft Linux Launcher UI"])]}),
               ("", {'layout': 'columns'}),
               ("", {'layout': 'columns'}),
               ("", {'layout': 'columns'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {
                "border_width": 1,
                "margin": 8,
                "border_focus": "#ebdbb2",
                "border_normal": "#1D2330"
                }
floating_theme = {
                "border_width": 0,
                "margin": 8,
#                "border_focus": "#ebdbb2",
#                "border_normal": "#1D2330"
                }

layouts = [
    layout.Columns(**layout_theme),
    # Try more layouts by unleashing below layouts.
    layout.Max(**floating_theme),
    # layout.Floating(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Inter',
    icon_size=20,
    fontsize=18,
    padding=3,
    background="#272727",
    foreground="#ebdbb2",
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(
                    length=10
                ),
                widget.LaunchBar(progs=[('', 'rofi -show drun', 'Launch Rofi')],
                    default_icon='/home/andrew/.config/qtile/icons/archlinux-gruvbox-green.png',
                    padding=0,
                ),
                widget.GroupBox(
                    font='FontAwesome 5 Free Solid',
                    fontsize=18,
                    disable_drag=True,
                    highlight_method='block',
                    block_highlight_text_color='#272727',
                    this_current_screen_border='#b8ba25',
                    urgent_border='#272727',
                    active='#b8ba25',
                    inactive='#b8ba25',
                ),
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                ),
# song name
#                widget.GenPollText(
#                    func=lambda: subprocess.check_output("/home/andrew/scripts/shell/mpvctitle").decode("utf-8"),
#                    update_interval=1,
#                    max_chars=32,
#                ),
                widget.Image(
                    filename='~/.config/qtile/icons/previous-button.png',
                    mouse_callbacks={
                                        'Button1': lambda: qtile.cmd_spawn('mpvc prev'),
                                    },
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/pause-button.png',
                    mouse_callbacks={
                                        'Button1': lambda: qtile.cmd_spawn('mpvc -p'),
                                    },
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/next-button.png',
                    mouse_callbacks={
                                        'Button1': lambda: qtile.cmd_spawn('mpvc next'),
                                    },
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/stop-button.png',
                    mouse_callbacks={
                                        'Button1': lambda: qtile.cmd_spawn('mpvc -k'),
                                    },
                ),
#song duration
#                widget.GenPollText(
#                    func=lambda: subprocess.check_output("/home/andrew/scripts/shell/mpvcduration").decode("utf-8"),
#                    update_interval=0.5,
#                ),
                widget.TaskList(
                    mouse_callbacks={'Button2': lambda: qtile.cmd_spawn('wmctrl -c :ACTIVE:')},
                    txt_floating='',
                    txt_minimized='',
                    borderwidth=0,
                    spacing=10,
                    margin=-3,
                ),
#                widget.WindowName(
#                    mouse_callbacks={
#                                        'Button1': lambda: qtile.lazy.spawn.toggle_minimize(),
#                                        'Button2': lambda: qtile.cmd_spawn('wmctrl -c :ACTIVE:')
#                                    },
#                    txt_floating=' ',
#                ),
                widget.TextBox(text=' '),
                widget.TextBox(
                    font='FontAwesome 5 Free Solid',
                    text='',
                    foreground='#b8ba25',
                ),
                widget.Memory( #ram
                    format = '{MemPercent:.0f}% ',
                    foreground='#b8ba25',
                ),
                widget.TextBox(
                    font='FontAwesome 5 Free Solid',
                    text='',
                    foreground='#fabd2f',
                ),
                widget.Memory( #swp
                    format = '{SwapPercent:.0f}% ',
                    foreground='#fabd2f',
                ),
                widget.TextBox(
                    font='FontAwesome 5 Free Solid',
                    text='',
                    foreground='#689d69',
                ),
                widget.CPU(
                    format='{load_percent}% ',
                    foreground='#689d69',
                ),
                widget.TextBox(
                    font='FontAwesome 5 Free Solid',
                    text='',
                    foreground='#fe8019',
                ),
                widget.ThermalSensor(
                    foreground='#fe8019',
                ),
                widget.TextBox(
                    font='FontAwesome 5 Free Solid',
                    text=' ',
                    foreground='#b16286',
                    mouse_callbacks={'Button3': lambda: qtile.cmd_spawn('pavucontrol'),
                                    'Button2': lambda: qtile.cmd_spawn('wmctrl -c :ACTIVE:')                     
                                    },
                ),
                widget.PulseVolume(
                    update_interval=0.1,
                    foreground='#b16286',
                    step=5,
                    mouse_callbacks={'Button3': lambda: qtile.cmd_spawn('pavucontrol'),
                                    'Button2': lambda: qtile.cmd_spawn('wmctrl -c :ACTIVE:')                     
                                    },
                ),
                widget.Clock( #day of the week
                    format=' %A ',
                ),
                widget.Clock( #number of the week
                    format='Week %W ',
                ),
                widget.Clock( #date
                    format='%Y/%m/%d',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('gsimplecal'),
                                       'Button2': lambda: qtile.cmd_spawn('wmctrl -c :ACTIVE:')                     
                    },
                ),
                widget.Clock( #time in hours, seconds, mins, 24h format
                    format=' %T',
                ),
                widget.Systray(
                    icon_size=22
                ),
                widget.Spacer(
                    length=10
                ),
#                widget.Systray(),
            ],
            25,
            margin=8
        ),
    ),
]
# Drag floating layouts.
mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='leafpad'),
    Match(wm_class='copyq'),
    Match(wm_class='opengl'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
],
    **floating_theme
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTile"
