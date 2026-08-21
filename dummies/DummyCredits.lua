PotatoPatchUtils.Team {
  name = 'The Dummy Gang',
  colour = SMODS.Gradients["chat_chaos"],
  loc = "TDG", -- Can also be `loc = 'k_exampleteam_name'` where the string is an arbitrary localization dictionary entry
  short_credit = true,
  credit_rows = {4,4}
}
SMODS.Atlas{
    key = "chat_dt_dummyteam",
    path = "dummygang/DummyCredits.png",
    px = 71,
    py = 95
}

PotatoPatchUtils.Developer {
  name = 'OneAct',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 0, y = 0},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'Celestro',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 1, y = 0},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'Jade',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 2, y = 0},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'PandaFly',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 3, y = 0},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'Mario',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 0, y = 1},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'RaiKon',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 1, y = 1},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'Kris',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 2, y = 1},
  calculate = function(self, context)
  end
}
PotatoPatchUtils.Developer {
  name = 'MoonKnight',
  colour = HEX('AF00AF'),
  loc = true, -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'The Dummy Gang', -- Must match an already existing Team name
  atlas = 'chat_dt_dummyteam',
  pos = {x = 3, y = 1},
  calculate = function(self, context)
  end
}
