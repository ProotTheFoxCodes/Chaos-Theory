G.FUNCS.solo_collection = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{
      definition = create_UIBox_solo_collection(),
    }
end

create_UIBox_solo_collection = function()
    return SMODS.card_collection_UIBox(ChaosTheory.SoloDevs[k], {5,5}, {
        no_materialize = false,
        h_mod = 0.95,
    })
end

PotatoPatchUtils.Developer {
  name = 'NOPE',
  colour = HEX('AF00AF'),
  team = false,
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  atlas = 'chat_dt_dummyteam',
  pos = {x = 0, y = 0},
  calculate = function(self, context)
  end
}