PotatoPatchUtils.Team{
    name = "Base Mod Devs",
    loc = "PotatoPatchTeam_basemod",
    colour = G.ARGS.LOC_COLOURS.chat_chao
}

SMODS.Atlas{
    key = "proto_base",
    px = 142,
    py = 190,
    path = "core/baseDevs/proto.png"
}

SMODS.Gradient{
    key = "proot",
    colours =  {
        HEX("F59BAD"),HEX("F8EADC"),HEX("FFD995"),HEX("D66B1C"),HEX("F8EADC")
    },
    cycle = 5
}

G.ARGS.LOC_COLOURS.chat_j8 = HEX('E1540F')
PotatoPatchUtils.Developer{
    name = "proto_basedev",
    team = "Base Mod Devs",
    colour = G.ARGS.LOC_COLOURS.tarot,
    loc = true,
    atlas = "chat_proto_base",
    pos = {x = 0, y = 1},
    soul_pos = {x = 1, y = 1},
    click = function(self)
        love.system.openURL("https://ko-fi.com/foxgirlproto")
    end,
    calculate = function(self,context)
        if context.starting_shop and G.GAME.chaos > 0 then
            for i = 1, G.GAME.chaos_slots do
                local probs = pseudorandom("CT_chaos_booster",0,1000)
                if probs/10 > (((math.floor(G.GAME.chaos*10)/10) / G.GAME.chaos_slots)*-1) + 100 then
                    local booster = SMODS.poll_object{ pool = { "p_chat_chaos_mini", "p_chat_chaos_standard", "p_chat_chaos_jumbo", "p_chat_chaos_mega" }}
                    SMODS.add_booster_to_shop(booster)
                end
                print(context.individual and context.card_effects)
            end
        end
    end
}

SMODS.Atlas{
    key = "ftdev",
    px = 71,
    py = 95,
    path = "core/baseDevs/FirstTryDev.png"
}

PotatoPatchUtils.Developer{
    name = "FirstTry",
    team = "Base Mod Devs",
    colour = ChaosTheory.C.CHAOS_C,
    loc = true,
    atlas = "chat_ftdev",
    pos = {x = 0, y = 0 },
    soul_pos = {x = 1, y = 0},
    loc_vars = function(self, info_queue)
        return { vars = { " " } }        
    end,
    click = function(self)
        love.system.openURL("https://github.com/TheActualFirstTry/BUSTED-BUFFOONS")
    end,
    calculate = function(self,context)
        if context.using_consumeable and context.consumeable.config.center.key == "c_chat_catalyst" then
            if G.GAME.chaos < 100 then
            G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
                G.GAME.slib_banished_keys[context.consumeable] = true
                G.GAME.banned_keys["c_chat_catalyst"] = true
				return true
			end,
		}))
        end
    end
end
}


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

SMODS.Atlas{
    key = "consumabPlaceH",
    path = "core/consumabPlaceH.png",
    px = 71,
    py = 96
}


local boosterType = "chaos"
local boosters = {
    {"mega",{2,1},{ x = 4, y = 1, extra = { x = 3, y = 1 } } },
    {"jumbo",{4,0},{ x = 1, y = 1, extra = { x = 0, y = 1 } } },
    {"standard",{0,0},{ x = 1, y = 0, extra = { x = 2, y = 0 } } },
    {"mini",{0,2},{ x = 1, y = 2 } }
}

for k,v in ipairs(boosters) do
    local atlas_ = "chaosBoosters"
    SMODS.Booster{
        key = boosterType.."_"..v[1],
        group_key = "chat_chaos_pack",
        atlas = atlas_,
        ppu_coder = {"proto_basedev"},
        ppu_artist = {"proto_basedev"},
        pos = { x = v[2][1] , y = v[2][2] },
        soul_pos = not not v[3] and v[3],
        kind = boosterType,
        disable_shine = true,
        cost = 10 - (2*k),
        ct_basemod = true,
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

SMODS.Atlas{
    key = "Hermesatlas",
    px = 71,
    py = 95,
    path = "core/HermesSpectral.png"
}

SMODS.Consumable{
    key = "hermes",
    set = "Spectral",
    atlas = "Hermesatlas",
    pos = { x = 0, y = 0 },
    cost = 5,
    ppu_artist = { "FirstTry" },
    ppu_coder = {"proto_basedev"},
    ct_basemod = true,
    config = {
        extra = {
            chaos = 5
        }
    },
    loc_vars = function (self, info_queue, card)
        return{ vars = {card.ability.extra.chaos} }
    end,
    use = function (self, card, area, copier)
        ease_chaos(card.ability.extra.chaos)
    end,
    can_use = function (self, card)
        return true
    end
}

SMODS.Consumable{
    key = "loki",
    set = "Spectral",
    atlas = "consumabPlaceH",
    pos = { x = 0, y = 2 },
    cost = 6,
    ppu_artist = nil,
    ppu_coder = {"proto_basedev"},
    ct_basemod = true,
    config = {
        extra = {
            chaos = 10,
            destroy = 6
        }
    },
    loc_vars = function (self, info_queue, card)
        local cae = card.ability.extra
        return{ vars = { cae.destroy, cae.chaos }}
    end,
    can_use = function (self, card)
        return #G.hand.cards >= card.ability.extra.destroy
    end,
    use = function (self, card, area, copier)
        local loki_cards = {}
        for i = 1, #G.hand.cards do
            if not (i > card.ability.extra.destroy) then
                loki_cards[#loki_cards+1] = pseudorandom_element(G.hand.cards,"loki_destroy",{
                    in_pool = function (v, args)
                        return not v.ability.loki_sel
                    end
                    }
                )
                loki_cards[#loki_cards].ability.loki_sel = true
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(loki_cards)

        delay(0.5)
        ease_chaos(card.ability.extra.chaos)
        delay(0.3)
    end
}


--[[ for testing purposes
eval SMODS.add_card{key = "j_chat_bleh"}
]]
SMODS.Joker{
    key = "bleh",
    loc_txt = {
        default = {
            name = "tester",
            text = {
                "+2 mult, x2 mult, ^2 mult, ^^2 mult, ^^^2 mult, 6,2 mult",
                "^^^3 mult in return.extra, ^^^4 mult in return.extra.extra"
            }
        }
    },
    no_collection = true,
    ct_basemod = true,
    ppu_coder = {"proto_basedev"},
    in_pool = function (self, args)
        return false
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                mult = 2,
                x_mult = 2,
                e_mult = 2,
                ee_mult = 2,
                eee_mult = 2,
                hyper_mult = {6,2},
                extra = {
                    eee_mult = 3,
                    extra = {
                        eee_mult = 4
                    }
                }
            }
        end
    end
}


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
    ct_basemod = true,
loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
    use = function(self, card, area, copier)
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
    ct_basemod = true,
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