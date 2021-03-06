local awful = require("awful")
local b = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

return {
    battery = function()
        local t = gears.timer {timeout = 1}

        local txt = wibox.widget.textbox()
        txt.align = "center"
        txt.font = b.battery_font

        local bat = wibox.container.arcchart(txt)
        bat.min_value = 0
        bat.max_value = 100
        bat.thickness = 2
        bat.start_angle = math.pi * 3 / 2

        t:connect_signal(
            "timeout", function()
                t:stop()

                local cap = io.open("/sys/class/power_supply/BAT0/capacity")
                local st = io.open("/sys/class/power_supply/BAT0/status")

                if cap and st then
                    local percent = cap:read("*n")
                    bat.value = percent

                    if percent == 100 then
                        bat.visible = false
                    else
                        bat.visible = true
                        txt:set_text(percent)
                        bat.colors = {
                            (st:read(8) == "Charging") and "#20a020"
                                or ((percent <= 30) and "#d01000" or "#a0a0a0"),
                        }
                    end

                    cap:close()
                    st:close()
                end

                t:again()
            end
        )
        t:start()
        t:emit_signal("timeout")

        return wibox.container.margin(bat, 2, 2, 2, 2, nil, false)
    end,
}
