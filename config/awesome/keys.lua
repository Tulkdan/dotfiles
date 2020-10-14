local awful = require("awful")
local b = require("beautiful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
--
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

local m = {"Mod4"}
local ma = {"Mod4", "Mod1"}
local mc = {"Mod4", "Control"}
local ms = {"Mod4", "Shift"}

local function exec(cmd) return function() awful.spawn(cmd) end end

local function maptag(f, i)
    return function()
        local s = awful.screen.focused()
        if s ~= nil then
            local tag = i and s.tags[i] or s.selected_tag
            if tag ~= nil then f(tag) end
        end
    end
end

local ckbs = {
    {m, "k", function() awful.client.focus.byidx(-1) end, "previous client"},
    {m, "j", function() awful.client.focus.byidx(1) end, "next client"},
    {ms, "q", function(c) c:kill() end, "kill the client"},
    {
        m,
        "f",
        function(c) c.fullscreen = not c.fullscreen end,
        "toggle fullscreen",
    }
}

local kbss = {
    help = {
      {m, "h", hotkeys_popup.show_help, "show help"},
      {mc, "r", awesome.restart, "reload awesome"},
      {m, "p", function() menubar.show() end, "show the menubar"}
    },
    session = {
        {mc, "l", exec({"xset", "s", "activate"}), "lock screen"},
        -- {ms, "q", awesome.quit, "quit awesome"},
        {
            mc,
            "Return",
            function()
                awful.spawn.easy_async_with_shell(
                    "sh $XDG_CONFIG_HOME/scripts/dmenu_config.sh \z
                    '1 - shutdown\\n \z
                    2 - reboot\\n \z
                    3 - lock screen\\n \z
                    4 - quit awesome\\n \z
                    5 - restart awesome\\n'", --
                    function(stdout)
                        ({
                            exec({"sudo", "init", "0"}),
                            exec({"sudo", "init", "6"}),
                            exec({"xset", "s", "activate"}),
                            awesome.quit,
                            awesome.restart,
                        })[stdout:byte() - 48]()
                    end
                )
            end,
            "session menu",
        },
    },
    layout = {
        {ms, "Left", function() awful.layout.inc(-1) end, "previous layout"},
        {ms, "Right", function() awful.layout.inc(1) end, "next layout"},
        {
            m,
            "i",
            function() awful.tag.incmwfact(-0.05) end,
            "reduce master width",
        },
        {
            m,
            "o",
            function() awful.tag.incmwfact(0.05) end,
            "increase master width",
        },
        {m, "u", awful.client.urgent.jumpto, "jump to urgent client"}
    },
    client = {
        {
            ms,
            "k",
            function() awful.client.swap.byidx(-1) end,
            "swap with previous client",
        },
        {
            ms,
            "j",
            function() awful.client.swap.byidx(1) end,
            "swap with next client",
        },
    },
    tag = {
        {m, "Left", awful.tag.viewprev, "view previous tag"},
        {m, "Right", awful.tag.viewnext, "view next tag"},
        {m, "BackSpace", awful.tag.history.restore, "go back"},
    },
    volume = {
        {
            {},
            "XF86AudioLowerVolume",
            exec({"amixer", "-q", "sset", "Master", "3%-"}),
            "lower volume",
        },
        {
            {},
            "XF86AudioRaiseVolume",
            exec({"amixer", "-q", "sset", "Master", "3%+"}),
            "raise volume",
        },
        {{}, "XF86AudioMute", exec({"pamixer", "-t"}), "toggle mute"},
    },
    brightness = {
        {
            {},
            "XF86MonBrightnessDown",
            exec({"xbacklight", "-5", "-time", "0"}),
            "reduce brightness",
        },
        {
            {},
            "XF86MonBrightnessUp",
            exec({"xbacklight", "+5", "-time", "0"}),
            "increase brightness",
        },
    },
    app = {
        {
            {},
            "Print",
            exec({"scrot", "-q", "100", "-c", "-e", "'mv $f ~/Pictures/screenshots/'"}),
            "take a screenshot"
        },
        {m, "Return", exec("alacritty"), "launch alacritty"},
        {m, "/", exec({"dmenu_run"}), "run prompt"},
        {m, "b", exec("firefox"), "launch firefox"},
        -- {m, "e", exec("code-oss"), "launch vscode"},
        -- {m, "f", exec("thunar"), "launch thunar"},
        -- {m, "m", exec({"alacritty", "-e", "ncmpcpp"}), "launch ncmpcpp"},
        {
            ms,
            "m",
            function()
                awful.spawn.with_shell("mpc update && mpc clear && mpc add /")
            end,
            "reload mpd",
        },
        -- {m, "r", exec({"rofi", "-show", "run", "-modi", "run"}), "launch rofi"},
        {m, ",", exec({"mpc", "toggle"}), "play or pause music"},
        {m, ".", exec({"mpc", "next"}), "next song in the playlist"},
        {m, "w", function () awful.spawn.with_shell("~/.config/scripts/wallpaper.sh") end, "change wallpaper"},
    },
}

for i = 1, 9 do
    table.insert(
        kbss.tag,
            {m, i, maptag(function(t) t:view_only() end, i), "view tag " .. i}
    )
    table.insert(
        kbss.tag, {ma, i, maptag(awful.tag.viewtoggle, i), "toggle tag " .. i}
    )
    table.insert(
        ckbs, {
            ms,
            i,
            function(c) maptag(function(t) c:move_to_tag(t) end, i)() end,
            "move client to tag " .. i,
        }
    )
    table.insert(
        ckbs, {
            mc,
            i,
            function(c) maptag(function(t) c:toggle_tag(t) end, i)() end,
            "toggle tag " .. i .. " for client",
        }
    )
end

local keys = {client = {}, global = {}}

for _, kb in pairs(ckbs) do
    keys.client = gears.table.join(
        keys.client, --
        awful.key(kb[1], kb[2], kb[3], {description = kb[4], group = "client"})
    )
end

for group, kbs in pairs(kbss) do
    for _, kb in pairs(kbs) do
        keys.global = gears.table.join(
            keys.global, awful.key(
                kb[1], kb[2], kb[3], {description = kb[4], group = group}
            )
        )
    end
end

return keys
