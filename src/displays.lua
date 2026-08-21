SMODS.Atlas{
    key = "logo",
    path = "ChaosTheoryLogo.png",
    px = 330,
    py = 58
}


SMODS.current_mod.menu_cards = function()
	return {
    remove_original = true,
   	{key = 'c_chat_catalyst'}
	}
end


--Thanks TheAstra

local mainmenuref = Game.main_menu
function Game:main_menu(change_context)
	local ret = mainmenuref(self, change_context)
	if ChaosTheory.config.menu then
        local SC_scale = 2 * (G.debug_splash_size_toggle and 0.8 or 1)
        G.SPLASH_CHAT_LOGO = Sprite(0, 0,
            6 * SC_scale,
            6 * SC_scale * (G.ASSET_ATLAS["chat_logo"].py / G.ASSET_ATLAS["chat_logo"].px),
            G.ASSET_ATLAS["chat_logo"], { x = 0, y = 0 }
        )
        G.SPLASH_CHAT_LOGO:set_alignment({
            major = G.title_top,
            type = 'cm',
            bond = 'Strong',
            offset = { x = 0, y = 3.35 }
        })
        G.SPLASH_CHAT_LOGO:define_draw_steps({ {
            shader = 'dissolve',
        } })

        -- Define logo properties
        G.SPLASH_CHAT_LOGO.tilt_var = { mx = 0, my = 0, dx = 0, dy = 0, amt = 0 }

        G.SPLASH_CHAT_LOGO.dissolve_colours = { ChaosTheory.C.CPINK, ChaosTheory.C.CBLUE }
        G.SPLASH_CHAT_LOGO.dissolve = 1

        G.SPLASH_CHAT_LOGO.states.collide.can = true

        -- Define node functions for FAC Logo
        function G.SPLASH_CHAT_LOGO:click()
            play_sound('button', 1, 0.3)
            SMODS.LAST_SELECTED_MOD_TAB = nil
            G.FUNCS.openModUI_chaostheory()
            G.OVERLAY_MENU:get_UIE_by_ID("overlay_menu_back_button").config.button = "exit_overlay_menu_mxms"
        end

        G.FUNCS.exit_overlay_menu_mxms = function()
            G.ACTIVE_MOD_UI = nil
            G.FUNCS.exit_overlay_menu()
        end

        function G.SPLASH_CHAT_LOGO:hover()
            G.SPLASH_CHAT_LOGO:juice_up(0.05, 0.03)
            play_sound('paper1', math.random() * 0.2 + 0.9, 0.35)
            Node.hover(self)
        end

        function G.SPLASH_CHAT_LOGO:stop_hover() Node.stop_hover(self) end

        --Logo animation
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = change_context == 'splash' and 3.6 or change_context == 'game' and 4 or 1,
            blockable = false,
            blocking = false,
            func = (function()
                play_sound('magic_crumple' .. (change_context == 'splash' and 2 or 3),
                    (change_context == 'splash' and 1 or 1.3), 0.9)
                play_sound('whoosh1', 0.2, 0.8)
                ease_value(G.SPLASH_CHAT_LOGO, 'dissolve', -1, nil, nil, nil,
                    change_context == 'splash' and 2.3 or 0.9)
                G.VIBRATION = G.VIBRATION + 1.5
                return true
            end)
        }))

        -- make the title screen use different background colors
        G.SPLASH_BACK:define_draw_steps({ {
            shader = 'splash',
            send = {
                { name = 'time',       ref_table = G.TIMERS,  ref_value = 'REAL_SHADER' },
                { name = 'vort_speed', val = 0.4 },
                { name = 'colour_1',   ref_table = ChaosTheory.C, ref_value = 'CHAOS_C' },
                { name = 'colour_2',   ref_table = G.C, ref_value = 'BLACK' },
            }
        } })
    end
    return ret
end