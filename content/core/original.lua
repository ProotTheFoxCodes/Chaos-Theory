SMODS.ConsumableType{
    key = "chat_chaos",
    default = "c_chat_catalyst",
    cards = {},
    collection_rows = { 5, 5 },
    primary_colour = ChaosTheory.C.CPINK,
    secondary_colour = HEX('3f3f3f'),
    text_colour = ChaosTheory.C.CHAOS_C,
    shop_rate = 0,
}

SMODS.ObjectType{
    key = "supreme",
    default = "j_chat_phantissimo",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
}

SMODS.ObjectType{
    key = "shiny",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
}
SMODS.Rarity {
    key = "supreme",
    default_weight = 0,
    pools = { ["supreme"] = true },
    badge_colour = ChaosTheory.C.CPINK,
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Rarity {
    key = "shiny",
    default_weight = 0.01,
    pools = { ["shiny"] = true },
    badge_colour = ChaosTheory.C.CPINK,
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Atlas {
    key = "atlas_u_chaos",
    path = "core/ChaosUndiscovered.png",
    px = 71,
    py = 95
}
SMODS.UndiscoveredSprite {
    key = "chat_chaos",
    atlas = "atlas_u_chaos",
    pos = {
        x = 0,
        y = 0
    }
}
SMODS.Atlas {
    key = "placeholderchaos",
    path = "ChaosCardTemplate.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'phant',
    path = 'core/Phantissimo.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'cata',
    path = 'core/Catalyst.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "placeHBoosters",
    path = "core/placeholdBooster.png",
    px = 71,
    py = 96
}

SMODS.Atlas{
    key = "chaosBoosters",
    path = "core/chaosBoosters.png",
    px = 71,
    py = 96
}


local boosterType = "chaos"
local boosters = {
    {"mega",{2,1}},
    {"jumbo",{0,1}},
    {"standard",{0,0},{ x = 1, y = 0, extra = { x = 2, y = 0 } } },
    {"mini",{0,2}}
}

for k,v in ipairs(boosters) do
    local atlas_ = "ulelele"
    if k == 3 then
        atlas_ = "chaosBoosters"
    else
        atlas_ = "placeHBoosters"
    end
    SMODS.Booster{
        key = boosterType.."_"..v[1],
        atlas = atlas_,
        pos = { x = v[2][1] , y = v[2][2] },
        soul_pos = not not v[3] and v[3],
        kind = boosterType,
        create_card = function(self, card)
            return {set = "chat_chaos", area = G.pack_cards, skip_materialize = true, soulable = true}
        end,
        config = {
            extra = 6-k,
            choose = math.min(5-k, 3)
        },
        in_pool = function (self, args)
            return false
        end
    }
end


SMODS.Consumable {
    key = 'catalyst',
   set = 'chat_chaos',
    atlas = "cata",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, new = { x = 1, y = 0 } },
    hidden = true,
    soul_rate = 0.00001,
    can_repeat_soul = true,
    soul_set = 'chaos',
loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
    use = function(self, card, area, copier)
        if G.GAME.chaos < 100 then
        G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
                G.GAME.banned_keys["c_chat_catalyst"] = true
				return true
			end,
		}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "chat_supreme", nil, nil, nil, "chat_catalyst")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
            end
        }))
        delay(0.6)
    else
        G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
                ease_chaos(-G.GAME.chaos)
				return true
			end,
		}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "chat_supreme", nil, nil, nil, "chat_catalyst")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
            end
        }))
        delay(0.6)
    end
end,
can_use = function(self, card)
        return G.jokers
    end,
}

SMODS.Joker{
    key = "phantissimo",
    rarity = "chat_supreme",
    pools = { ["supreme"] = true },
    atlas = "phant",
    blueprint_compat = true,
    forcetrigger_compat = true,
    discovered = true,
    unlocked = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
    cost = 100,
    attributes = { "passive", "chaos" },
    config = {
        immutable = {
            chaos = 5
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.immutable.chaos, G.GAME.chaos or 0
            },
        }
    end,
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == "Joker" and context.card.config.center_key ~= "j_chat_phantissimo" then
            ease_chaos(card.ability.immutable.chaos)
        end
    if G.GAME.chaos > 0 then
        if context.joker_main then
            return { emult = G.GAME.chaos/2}
        end
    end
end
}
