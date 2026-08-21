ChaosTheory.Imp({
    unlocked = true,
	discovered = true,
	pos = { x = 0, y = 0 },
	atlas = "impl",
	key = "emmy",
	config = {},
    ppu_artist = {"OneAct"},
    ppu_coder = {"Jade"},
    ppu_team = {"The Dummy Gang"},
	blueprint_compat = true,
  apply = function(self)
    G.GAME.modifiers.enable_eternals_in_shop = true
    end,
})