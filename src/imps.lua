SMODS.Atlas{
    key = "impl",
    path = "core/Impless.png",
    px = 34,
    py = 34
}

SMODS.ObjectType{
    key = "chat_imp",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
}

ChaosTheory.Imp = SMODS.Center:extend({
    unlocked = true,
	discovered = true,
	pos = { x = 0, y = 0 },
	display_size = {w = 34, h = 34},
	pixel_size = {w = 34, h = 34},
	atlas = "impl",
	cost = 4,
	config = {},
	blueprint_compat = true,
	set = "chat_imp",
	attributes = {},
	class_prefix = "imp",
        required_params = {
            'key',
            'pos',
			'atlas',
        },
        pre_inject_class = function(self)
            G.P_CENTER_POOLS[self.set] = {}
        end,
	set_card_type_badge = function(self, card, badges)
		badges[#badges + 1] = create_badge(localize(card.config.center.badge_key or "k_chat_imp"), ChaosTheory.C.CPINK, G.C.WHITE, 1.2)
	end,
    apply = function(self)
    end,
--[[	    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		end]]
	inject = function(self)
		self.config = self.config or {}
		SMODS.Center.inject(self)
	end,
})


function ChaosTheory.Imp:is_discovered()
    return self.discovered or G.PROFILES[G.SETTINGS.profile].all_unlocked
end

--- Gets the current imp center, or impless if there is none
--- @return ChaosTheory.Imp
--- @return Card|nil
function ChaosTheory.get_imp()
	local imp = G.chat_imp_area.cards[1]
	if not imp then return G.P_CENTERS.imp_chat_impless end
	return imp.config.center, imp
end

--- call the given method on the currently owned imp
---@param method any the method to call, if it exists
---@param ... any arguments for the method (excluding the card)
function ChaosTheory.imp_function(method, ...)
	local center, imp = ChaosTheory.get_imp()
	if center[method] and type(center[method]) == "function" then
		return center[method](center, imp, ...)
	end
end


SMODS.current_mod.custom_collection_tabs = function()
    local tally = 0
    for _, v in pairs(G.P_CENTER_POOLS['chat_imp']) do
        if v:is_discovered() then
            tally = tally + 1
        end
    end
    return { UIBox_button {
        count = {tally = tally, of = #G.P_CENTER_POOLS['chat_imp']},
        button = 'your_collection_chat_imp', label = {localize("k_chat_imp")}, minw = 5, id = 'your_collection_chat_imp'
    }}
end

G.FUNCS.your_collection_chat_imp = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{
      definition = create_UIBox_your_collection_chat_imp(),
    }
end

create_UIBox_your_collection_chat_imp = function()
    return SMODS.card_collection_UIBox(G.P_CENTER_POOLS['chat_imp'], {5,5}, {
        no_materialize = false,
        h_mod = 0.34,
		w_mod = 0.5
    })
end

ChaosTheory.Imp({
    unlocked = true,
	discovered = true,
	pos = { x = 0, y = 0 },
--[[	display_size = {w = 34, h = 34},
	pixel_size = {w = 34, h = 34},]]
	atlas = "impl",
	key = "impless",
    ct_basemod = true,
	config = {},
	blueprint_compat = true,
  apply = function(self)
    end,
})

SMODS.Atlas{
	key = "sti",
	path = "core/Stingy.png",
	px = 34,
	py = 34
}
ChaosTheory.Imp({
    unlocked = true,
	discovered = true,
	pos = { x = 0, y = 0 },
--[[	display_size = {w = 34, h = 34},
	pixel_size = {w = 34, h = 34},]]
	atlas = "sti",
	key = "stingy",
    ct_basemod = true,
	config = {},
    ppu_artist = { "FirstTry" },
    ppu_coder = { "FirstTry" },
	blueprint_compat = true,
  apply = function(self)
	    G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
		G.GAME.modifiers.no_blind_reward.Big = true
    end,
})


SMODS.RunSelectPage({
	key = 'imp_choice',
	generate_pool = function() return G.P_CENTER_POOLS.chat_imp end,
	grid_size = {2, 4},
	automatic_preview = true,
	selection_limit = 1e308,
--	random_select = true,

quick_start_text = function()
	if not G.PROFILES[G.SETTINGS.profile].last_choices.chat_imp_choice then return "Imps: 0" end
    local choice = 0
    for k,v in pairs(G.PROFILES[G.SETTINGS.profile].last_choices.chat_imp_choice) do
        if G.PROFILES[G.SETTINGS.profile].last_choices.chat_imp_choice[k] == true then
            choice = choice + 1
        end
    end
        return "Imps: " .. choice
    end,
	selected_text = function(self, selection)
		return "Imps"
	end,
	start_run = function(self, choice)
		G.GAME.saved_imps = G.GAME.saved_imps or {}
	    for _, c in ipairs(G.P_CENTER_POOLS.chat_imp) do
  			if choice[c.key] and type(c.apply) == "function" then
    		c:apply()
			G.GAME.saved_imps[#G.GAME.saved_imps+1] = c.key
	  		end
		end   
    end,
	set_default = function(self, choice)
		if G.GAME.saved_imps and #G.GAME.saved_imps > 0 then
			local list = {}
			for _, imp_key in ipairs(G.GAME.saved_imps or {}) do
    	    	list[#list+1] = G.P_CENTERS[imp_key]
	    	end
--			choice = list
			list = choice
			return list
		else
		return nil
		end
    end,

})
SMODS.current_mod.custom_card_areas = function(G)
    G.chat_imp_area = CardArea( 
        0,
        0,
        G.CARD_W * 0.34,
        G.CARD_H * 0.34,
        {
            type = 'chat_imp',
            bg_colour = G.C.CLEAR,
            no_card_count = true,
            align_buttons = true,
        }
    )
end

-- Generate the UI For selected imps.
---@return UINode
function G.UIDEF.saved_imps()
    local imps_per_row = 7
    -- This is implemented similarly to vouchers
    local silent = false
    local imps = {}
    local imp_areas = {}
    local imp_areas_in_current_row = {}
    local imp_rows = {}

    for _, imp_key in ipairs(G.GAME.saved_imps or {}) do
        table.insert(imps, G.P_CENTERS[imp_key])
    end

    for _, imp_proto in ipairs(imps) do
        if next(imp_proto) then -- "Does the table contain ANY key?"
            if #imp_areas % imps_per_row == 0 then
                -- Create a new row
                table.insert(imp_rows,
                {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes=imp_areas_in_current_row}
                )
                imp_areas_in_current_row = {}
            end

            table.insert(imp_areas, CardArea(
                --[[ X ]] G.ROOM.T.x + 0.2*G.ROOM.T.w/2,
                --[[ Y ]] G.ROOM.T.h,
                --[[ W ]] (#imp_proto == 1 and 1 or 1)*G.CARD_W,
                --[[ H ]] (#imps >=1 and 1 or 1)*G.CARD_H,
                { -- config
                    card_limit = 1,
                    type = 'voucher',
                    highlight_limit = 0,
                    chat_run_info_redeemed_imps = true, --identifier flag
                }
            ))
            local latest_cardarea = imp_areas[#imp_areas]

            local card = Card(
                --[[      X ]] latest_cardarea.T.x + latest_cardarea.T.w/2,
                --[[      Y ]] latest_cardarea.T.y,
                --[[      W ]] G.CARD_W,
                --[[      H ]] G.CARD_H,
                --[[   card ]] nil,
                --[[ center ]] imp_proto,
                { -- params
                    bypass_discovery_center=true,
                    bypass_discovery_ui=true,
                    bypass_lock=true
                }
            )
            card.ability.order = imp_proto.order
            card:start_materialize(nil, silent)
            silent = true -- prevent sound stacking

            latest_cardarea:emplace(card)
            table.insert(imp_areas_in_current_row,
            {n=G.UIT.C, config={align = "cm", padding = 0, no_fill = true}, nodes={
                {n=G.UIT.O, config={object = latest_cardarea}}
            }}
            )
        end
    end

    table.insert(imp_rows,
    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes=imp_areas_in_current_row}
    )

    local t = #imps > 0 and (
        {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.O, config={object = DynaText({
                    string = {localize('ph_imps')},
                    colours = {G.C.UI.TEXT_LIGHT},
                    bump = true,
                    scale = 0.6})
                }}
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.5}, nodes={
            }},
            {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 1, padding = 0.15, emboss = 0.05}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes=imp_rows},
            }}
        }}
    ) or (
        {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = DynaText({
                string = {localize('ph_no_imps')},
                colours = {G.C.UI.TEXT_LIGHT},
                bump = true,
                scale = 0.6})
            }}
        }}
    )
    return t
end
