
SMODS.Atlas {
    key = "pissj",
    path = "core/Pissjoker.png",
    px = 71,
    py = 95
}


SMODS.Joker{
    key = "piss", 
    rarity = "chat_shiny",
    pools = { ["shiny"] = true },
    atlas = "pissj",
    blueprint_compat = true,
    forcetrigger_compat = true,
    discovered = true,
    unlocked = true,
    ppu_coder = {"OneAct"},
    ppu_artist = {"Jade"},
    eternal_compat = true,
    pos = { x = 0, y = 0 },
    cost = 16,
    attributes = { "passive", "asc", "x_axc", "exp_asc" },
    config = {
        extra = {
            value = 5
        },
        immutable = {
        },
    },
    loc_vars = function(self, info_queue, card)
        local a = card.ability.extra.value
        return {
            vars = {
                a, a/2, (a/2)/2,
            },
        }
    end,
    calculate = function(self, card, context)
        local asc = card.ability.extra.value
        if context.joker_main then
            return { asc = asc, x_asc = asc/2, exp_asc = (asc/2)/2 }
        end
end
}
