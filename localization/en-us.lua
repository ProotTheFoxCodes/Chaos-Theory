return {
    descriptions = {
        PotatoPatch = {
            PotatoPatchTeam_basemod = { name = "Base Event Mod Developers"},
            PotatoPatchDev_proto_basedev = {
                name = "The Proto System",
                text = {
                    {
                        "{C:inactive,s:0.85}aka ProdByProto",
                        "{C:blue,s:0.85}Bluesky{} {s:0.85}@prodbyproto.bsky.social",
                        "{C:chat_proot,s:1.35}2{}{C:chat_proot,s:1.25} of us as far as we know :3c",
                        "{C:chat_sylveon,s:1.15}A sylveon      {C:chat_proot,s:1.15}and       {C:chat_fox,s:1.15}A foxgirl",
                        "{C:inactive,s:0.85}it/she{}{s:1.15}        {C:inactive,s:0.85}plural{}{s:1.15}       {}{C:inactive,s:0.85} it/they",
                    },
                    {
                        "{C:attention}Click{} on {C:uncommon}Clippy!Ralsei{} to view my ko-fi link,",
                        "where you can donate to support my music production,",
                        "balatro modding, commission music, or get a membership.",
                        "{s:0.85}Technically, subscribing doesn't do anything yet, but if",
                        "{s:0.85}interest in that picks up, we&'ll ask subscribers about what they want :3"
                    },
                    {
                        "This {C:dark_edition}credit art{} was drawn by {C:chat_j8}J8-Bit",
                        "{C:blue,s:0.85}Bluesky{} {s:0.85}@j8-bit.bsky.social"
                    }
                }
            },
            PotatoPatchDev_FirstTry = {
                name = "FirstTry",
                text = {
                    {"Hi I made this mod",
                    "I also made {s:1.5,C:chat_chao}Busted Buffoons{}.",
                    "I'm mostly an artist",
                    "but I learned how to program mods last year.",
                    "Thank you to all who participated!"},
                    {"If you wanna check out {s:1.5,C:chat_chao}Busted Buffoons{}, click on my OC."}
                }
            },
        },
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
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_standard = { 
				name = "Chaos Pack",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_jumbo = { 
				name = "Jumbo Chaos Pack",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			},
            p_chat_chaos_mega = { 
				name = "Mega Chaos Pack",
				text={
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:chat_chao} Chaos{} cards to",
					"be used immediately",
				}
			}
            
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
            k_chat_solo_creds = "Solo Credits",
            k_chat_chaos = "Chaos",
            b_chat_chaos_cards = "Chaos Cards",
            k_chat_supreme = "Supreme",
            k_chat_shiny = "Shiny",
            k_chaos = "Chaos",
            ["chat_chaos_pack"] = "Chaos Pack",
            k_chat_imp = "Imps",
            k_chat_imp_card = "Imp",
            run_select_chat_imp_choice = "Select Imps",
            run_select_chat_imp_choice_random = "Random Imp",
            ph_no_imps = "No Imps in this run",
			ph_imps = "Imps in this run",
            b_imps = "Imps",
            ct_basemod = "Base Mod Addition"
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
        v_text={
            ct_basemod_infoQ1 = {"{C:white}This was added"},
            ct_basemod_infoQ2 = {"{C:white}to {C:chat_chao}Chaos Theory"},
            ct_basemod_infoQ3 = {"{C:white}before the main event!"}
        },
    },
}