ChaosTheory = ChaosTheory or {}
ChaosTheory.mod = SMODS.current_mod
ChaosTheory.config = SMODS.current_mod.config
ChaosTheory.SoloDevs = {}

function ChaosTheory.reset_game_globals(run_start) end


SMODS.Atlas{
	key = "modicon",
	path = "Modicon.png",
	px = 34,
	py = 34
}

	local bl = {
		-- Format entries as `['filename.txt'] = true`
		['credits.lua'] = true,
--		['DummyCredits.lua'] = true,
--		['imps.lua'] = true
	}
PotatoPatchUtils.load_files(ChaosTheory.mod.path .. '/src', bl)
PotatoPatchUtils.load_files(ChaosTheory.mod.path .. '/content')
--PotatoPatchUtils.load_files(ChaosTheory.mod.path .. '/dummies')
for k,v in pairs(PotatoPatchUtils.Developers) do
	if not v.team and v.mod_id == "chaostheory" then
		ChaosTheory.SoloDevs[k] = v
	end
end
SMODS.current_mod.extra_tabs = PotatoPatchUtils.CREDITS.register_page(SMODS.current_mod)
SMODS.handle_loc_file(ChaosTheory.mod.path)
PotatoPatchUtils.LOC.init()
