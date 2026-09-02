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

function ChaosTheory.create_credit_tab(mod, no_teams)
        local mod_devs = {}
        local i = 1
        for _, dev in pairs(ChaosTheory.SoloDevs) do
            if dev.mod_id == mod.id then
                if type(mod_devs[i]) ~= 'table' then
                    mod_devs[i] = {}
                end
                table.insert(mod_devs[i], dev)
                if #mod_devs[i] == 10 then
                    i = i + 1
                end
            end
        end

        PotatoPatchUtils.current_devs_credits_page = 1
        PotatoPatchUtils.max_devs_credits_pages = #mod_devs

        return {n = G.UIT.ROOT, config = { align = "m", r = 0.1, padding = 0.05, colour = G.C.BLACK, minw = 8, minh = 9 }, nodes = {
            {n=G.UIT.C, config = {align = 'cm', id = 'ppu_credits_page_nodes', devs = mod_devs, current_page = 1}, nodes = {
                next(mod_devs) and PotatoPatchUtils.CREDITS.create_devs_credit_page(mod_devs[1]),
            }}
        }}
    end

SMODS.current_mod.extra_tabs = function()
	return{
    	{tab_definition_function = function()
        	return ChaosTheory.create_credit_tab(ChaosTheory.mod)
        end,
	    label = localize("k_chat_solo_creds")},
    	{tab_definition_function = function()
        	return PotatoPatchUtils.CREDITS.create_credit_tab(ChaosTheory.mod)
        end,
	    label = localize('ppu_credits_tab_label')},
    } 
end
SMODS.handle_loc_file(ChaosTheory.mod.path)
PotatoPatchUtils.LOC.init()
