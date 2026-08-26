--Colour UI

G.ARGS.LOC_COLOURS.chat_fox = HEX("D66B1C")
G.ARGS.LOC_COLOURS.chat_sylveon = HEX("F59BAD")

SMODS.current_mod.ui_config = {
  colour = darken(G.C.BLACK, .2),
  author_colour = ChaosTheory.C.CPINK,
  bg_colour = adjust_alpha(G.C.BLACK, 0.90),
  back_colour = ChaosTheory.C.CPINK,
  tab_button_colour = ChaosTheory.C.CPINK,
  collection_option_cycle_colour = ChaosTheory.C.CPINK,
  outline_colour = lighten(ChaosTheory.C.CPINK, .2),
}

--Chaos Stuff

function SMODS.current_mod.reset_game_globals(run_start)
  if run_start then
    G.GAME.chaos = 0
    G.GAME.max_chaos = 200
    G.GAME.chaos_slots = 2
  end
end


local uibox_ref = create_UIBox_HUD
function create_UIBox_HUD()
  local orig = uibox_ref()
    local scale = 0.4
    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)

    local contents = {}

    local spacing = 0.13
    local temp_col = G.C.DYN_UI.BOSS_MAIN
    local temp_col2 = G.C.DYN_UI.BOSS_DARK
    
    contents.buttons = {
      {n=G.UIT.C, config={align = "cm", r=0.1, colour = G.C.CLEAR, shadow = true, id = 'button_area',padding=0.33}, nodes={
        {n=G.UIT.R, config={id = 'run_info_button', align = "cm", minh = 1, minw = 1.5,padding = 0.05, r = 0.1, hover = true, colour = G.C.RED, button = "run_info", shadow = true}, nodes={
        {n=G.UIT.R, config={align = "cm", padding = 0, maxw = 2}, nodes={
          {n=G.UIT.T, config={text = localize('b_run_info_1'), scale = 1.2*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
        }},
        {n=G.UIT.R, config={align = "cm", padding = 0, maxw = 2}, nodes={
          {n=G.UIT.T, config={text = localize('b_run_info_2'), scale = 1*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true, focus_args = {button = G.F_GUIDE and 'guide' or 'back', orientation = 'bm'}, func = 'set_button_pip'}}
        }}
        }},
        {n=G.UIT.R, config={align = "cm", minh = 1, minw = 2,padding = 0.05, r = 0.1, hover = true, colour = G.C.ORANGE, button = "options", shadow = true}, nodes={
        {n=G.UIT.C, config={align = "cm", maxw = 1.4, focus_args = {button = 'start', orientation = 'bm'}, func = 'set_button_pip'}, nodes={
          {n=G.UIT.T, config={text = localize('b_options'), scale = scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
        }},
        }},
        {n=G.UIT.R, config={align = "cm", minh = 1, minw = 2,padding = 0.05, r = 0.1, hover = true, colour=G.C.DYN_UI.BOSS_MAIN,emboss=0.05,detailed_tooltip = { set = "Other", key = "chat_chaos_desc", vars = { G.GAME.max_chaos, G.GAME.chaos_slots } },}, nodes={
        {n=G.UIT.R, config={align = "cm", maxw = 1.35}, nodes={
          {n=G.UIT.T, config={text = localize('k_chaos'), minh = 0.33, scale = 0.85*scale, colour = SMODS.Gradients["chat_chaos"], shadow = true}},
        }},
        {n=G.UIT.R, config={align = "cm", r = 0.1, minw = 1.8, colour = temp_col2, id = 'row_chaos_text'}, nodes={
          {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'chaos'}}, colours = {SMODS.Gradients["chat_chaos"]},shadow = true, scale = 2*scale}),id = 'chaos_UI_count'}},
        }},
        }}
      }}
    }
    --heres the one bit of compat ill do on my end
    if SMODS.Mods.jen and SMODS.Mods.jen.can_load then
      orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[6] = {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.C, config={id = 'hud_tension',align = "cm", padding = 0.05, minw = 1.45, minh = 1, colour = temp_col, emboss = 0.05, r = 0.1}, nodes={
          {n=G.UIT.R, config={align = "cm", minh = 0.33, maxw = 1.35}, nodes={
            {n=G.UIT.T, config={text = 'Tension', scale = 0.85*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
          }},
          {n=G.UIT.R, config={align = "cm", r = 0.1, minw = 1.2, colour = temp_col2}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'tension'}}, colours = {G.C.CRY_EMBER},shadow = true, font = G.LANGUAGES['en-us'].font, scale = scale_number(G.GAME.tension, 2*scale, 100)}),id = 'tension_UI_count'}},
          }},
        }},
        {n=G.UIT.C, config={minw = spacing},nodes={}},
        {n=G.UIT.C, config={id = 'hud_relief',align = "cm", padding = 0.05, minw = 1.45, minh = 1, colour = temp_col, emboss = 0.05, r = 0.1}, nodes={
          {n=G.UIT.R, config={align = "cm", minh = 0.33, maxw = 1.35}, nodes={
            {n=G.UIT.T, config={text = 'Relief', scale = 0.85*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
          }},
          {n=G.UIT.R, config={align = "cm", r = 0.1, minw = 1.2, colour = temp_col2}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'relief'}}, colours = {G.C.CRY_VERDANT},shadow = true, font = G.LANGUAGES['en-us'].font, scale = scale_number(G.GAME.relief, 2*scale, 100)}),id = 'relief_UI_count'}},
          }},
        }},
        {n=G.UIT.C, config={minw = spacing},nodes={}},
        {n=G.UIT.C, config={id = 'hud_chaos',align = "cm", padding = 0.05, minw = 1.45, minh = 1, colour = temp_col, emboss = 0.05, r = 0.1, detailed_tooltip = { set = "Other", key = "chat_chaos_desc", vars = { G.GAME.max_chaos, G.GAME.chaos_slots } }}, nodes={
          {n=G.UIT.R, config={align = "cm", minh = 0.33, maxw = 1.35}, nodes={
            {n=G.UIT.T, config={text = localize('k_chaos'), scale = 0.85*scale, colour = SMODS.Gradients["chat_chaos"], shadow = true}},
          }},
          {n=G.UIT.R, config={align = "cm", r = 0.1, minw = 1.2, colour = temp_col2}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'chaos'}}, colours = {SMODS.Gradients["chat_chaos"]},shadow = true, font = G.LANGUAGES['en-us'].font, scale = 2*scale}),id = 'chaos_UI_count'}},
          }},
        }},
      }}
    else  
      orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes = contents.buttons
    end
    return orig
end

function ease_chaos(mod)
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
          local round_UI = G.HUD:get_UIE_by_ID('chaos_UI_count')
          mod = mod or 0
          local text = '+'
          local col = SMODS.Gradients["chat_chaos"]
          if to_big(mod) < to_big(0) then
              text = ''
              col = G.C.BLACK
          end
          G.GAME.chaos = (G.GAME.chaos or 0) + mod
          if G.GAME.chaos > G.GAME.max_chaos then
            G.GAME.chaos = G.GAME.chaos - G.GAME.max_chaos
            G.GAME.max_chaos = G.GAME.max_chaos + 100
            G.GAME.chaos_slots = G.GAME.chaos_slots + 1
          end
          if round_UI then
            G.HUD:recalculate()
            if not Spectrallib.should_skip_animations() then
              attention_text({
                text = text..tostring(math.abs(mod)),
                scale = 1, 
                hold = 0.7,
                cover = round_UI.parent,
                cover_colour = col,
                align = 'cm',
              })
            end
          end
          --Play a chip sound
          if not Spectrallib.should_skip_animations() then
            play_sound('timpani', 0.8)
            play_sound('generic1')
          end
          return true
      end
    }))
end

local attributes = {
    "chaos"
}

for _, v in ipairs(attributes) do
    SMODS.Attribute { key = v }
end


-- Enforced tetration limit
local calc_ref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local logger = (pcall(function() require "debugplus.logger" end) and require "debugplus.logger") or {
        log = print,
        debug = print,
        info = print,
        warn = print,
        error = print
    }
    --print(scored_card)
    if scored_card and scored_card.config.center and scored_card.config.center.mod and scored_card.config.center.mod.id == "chaostheory" then
      local deepestExtra = effect
      while true do
        local goDeeper = false
        if deepestExtra.eee_mult or deepestExtra.eee_chips then
            logger.warn("Pentation (^^^) is not allowed in this event, defaulting to tetration (^^).")
            if not deepestExtra.extra then deepestExtra.extra = {} else goDeeper = true end
            deepestExtra.extra.ee_mult = deepestExtra.eee_mult
            deepestExtra.extra.ee_chips = deepestExtra.eee_chips
            deepestExtra.eee_mult, deepestExtra.eee_chips = nil
        end
        if deepestExtra.hyper_mult or deepestExtra.hyper_chips then
            logger.warn("Hyperoperation is not allowed in this event, as it is higher than tetration. Defaulting to tetration (^^).")
            if not deepestExtra.extra or not deepestExtra.extra.extra then deepestExtra.extra.extra = {} else goDeeper = true end
            deepestExtra.extra.ee_mult, deepestExtra.extra.ee_chips = (deepestExtra.hyper_mult and deepestExtra.hyper_mult[2]), (deepestExtra.hyper_chips and deepestExtra.hyper_chips[2])
            deepestExtra.hyper_chips, deepestExtra.hyper_mult = nil
        end
        if goDeeper then  deepestExtra = deepestExtra.extra  else break end
      end
    end
    return calc_ref(effect, scored_card, key, amount, from_edition)
end


-- "Base Mod" badge
local CT_mod_badges = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj,badges)
  CT_mod_badges(obj,badges)
  if obj and (obj.ct_basemod and obj.mod.id == "chaostheory") then
    badges[#badges+1] = {n=G.UIT.R, config={align = 'tm'}, nodes={
                {n=G.UIT.R, config={align='cm', padding = 0.03}, nodes={{n=G.UIT.T, config={text = localize("ct_basemod"), shadow = true, colour = SMODS.Gradients["chat_chaos"] or G.C.UI.BACKGROUND_WHITE, scale = 0.27}}}}
            }}
  end
end