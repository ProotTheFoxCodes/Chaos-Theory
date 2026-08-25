return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            j_chat_phantissimo = {
                name = {"Phantissimo"},
                text = {
                    {"Generates {C:white,X:chat_chao}+#1#{} Chaos when",
                "a joker is {C:attention}sold"},
                {"Gives {C:white,X:slib_emult}^Mult{} equal to",
                "half your current {C:white,X:chat_chao}Chaos",
            "{C:inactive}(Currently: {C:white,X:chat_chao}#2#{C:inactive})"}
                }
            },
        },
        Other={
            undiscovered_chat_chaos = {
                name = { "Not Discovered" },
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
                },
            },
            chat_chaos_desc = {
                name = "Chaos",
                text = {
                    "The more {X:chat_chao,C:white}Chaos{} you have, the higher",
                    "the chance a {C:chat_chao}Chaos Pack{} will {C:attention}spawn {}in the {C:attention}Shop{}",
                    "by {C:attention}1%{} for each {X:chat_chao,C:white}Chaos{}. Every time the current",
                    "maximum of {C:attention}#1#{} {X:chat_chao,C:white}Chaos {} is exceeded, set {X:chat_chao,C:white}Chaos {} to{C:attention} 0{},",
                    "{C:attention}+100 {}max {X:chat_chao,C:white}Chaos {} and {C:attention}+1{} to max {C:chat_chao}Chaos Packs{}.",
                    "{C:inactive}(Currently up to {}{C:attention}#2#{}{C:inactive} Chaos Packs.)",
                    "{C:chat_chao}Chaos Packs {}don't replace other booster packs, and",
                    "probabilities are evenly distributed across each possible",
                    "{C:chat_chao}Chaos Pack {}that could spawn."
                }
            },
            p_chat_chaos_mini = { 
				name = "Mini Chaos Pack",
				group_name = "Chaos Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_standard = { 
				name = "Chaos Pack",
				group_name = "Chaos Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_jumbo = { 
				name = "Jumbo Chaos Pack",
				group_name = "Chaos Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_mega = { 
				name = "Mega Chaos Pack",
				group_name = "Chaos Card",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{X:chat_chao,C:white} Chaos{} cards to",
					"be used immediately",
				}
			},
            
        },
        Planet={},
        Spectral={
            c_chat_hermes = {
                name = {
                    "Hermes",
                    "{C:inactive,s:0.85}Ancient Greek God of Wit"
                },
                text = {
                    "Gain {C:attention}#1# {}{X:chat_chao,C:white}Chaos{}."
                }
            },
            c_chat_loki = {
                name = {
                    "Loki",
                    "{C:inactive,s:0.85}Norse Trickster God"
                },
                text = {
                    "Destroys {C:attention}#1# {}random",
                    "cards in hand,",
                    "gain {C:attention}#2# {}{X:chat_chao,C:white}Chaos{}."
                }
            }
        },
        chat_chaos={
            c_chat_catalyst = {
                name = {"Catalyst"},
                text = {
                    {"Spawns a {C:chat_chao}Supreme{} Joker",
                        "and sets your {C:chat_chao}Chaos{} to {C:white,X:black}0"},
                        {"Gets {C:red}banished{} if used under {C:white,X:chat_chao}100{} Chaos"},
                    }
            },
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
        chat_imp = {
            imp_chat_impless = {
                name = { "Impless" },
                text = { "Does nothing?" }
            },
            imp_chat_stingy = {
                name = { "Stingy" },
                text = { "Small and Big Blinds","give no money" }
            }
        }
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_chat_chaos = "Chaos",
            b_chat_chaos_cards = "Chaos Cards",
            k_chat_supreme = "Supreme",
            k_chat_shiny = "Shiny",
            k_chaos = "Chaos",
            k_chat_imp = "Imps",
            k_chat_imp_card = "Imp",
            run_select_chat_imp_choice = "Select Imps",
            run_select_chat_imp_choice_random = "Random Imp",
            ph_no_imps = "No Imps in this run",
			ph_imps = "Imps in this run",
            b_imps = "Imps",
        },
        high_scores={},
        labels={
            k_chat_supreme = "Supreme",
            k_chat_shiny = "Shiny",
            k_chaos = "Chaos",
            k_chat_imp = "Imps",
            k_chat_imp_card = "Imp",
            b_imps = "Imps",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}