SMODS.current_mod.ui_config = {
  colour = darken(G.C.BLACK, .2),
  author_colour = ChaosTheory.C.CPINK,
  bg_colour = adjust_alpha(G.C.BLACK, 0.90),
  back_colour = ChaosTheory.C.CPINK,
  tab_button_colour = ChaosTheory.C.CPINK,
  collection_option_cycle_colour = ChaosTheory.C.CPINK,
  outline_colour = lighten(ChaosTheory.C.CPINK, .2),
}

ChaosTheory.credits = {
  squad = {
    colour = G.C.GREEN,
    entries = {
      "FirstTry",
    }
  },
  artists = {
    colour = G.C.CHIPS,
    entries = {
      "FirstTry",
    }
  },
  coders = {
    colour = G.C.PURPLE,
    entries = {
      "FirstTry",
    }
  },
  shaders = {
    colour = G.C.MULT,
    entries = {
    }
  }
}


-- credits stuff. thanks again paperback
SMODS.current_mod.extra_tabs = function()
    local result = {}

    for k, v in pairs(ChaosTheory.credits) do
        local parsed = {}

        for _, entry in ipairs(v.entries) do
            parsed[#parsed + 1] = {
                n = G.UIT.R,
                config = { align = 'cm', minh = 0.25 },
                nodes = {
                    { n = G.UIT.T, config = { text = entry, colour = v.colour, scale = 0.4 } }
                }
            }
        end

        result[k] = parsed
    end

    local credits_tab = {
        n = G.UIT.ROOT,
        config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { padding = 0.5 },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = 'cm' },
                                nodes = {
                                    { n = G.UIT.T, config = { text = "1", colour = G.C.WHITE, scale = 0.75 } },
                                }
                            },
                            unpack(result.squad)
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { padding = 0.5 },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = 'cm' },
                                nodes = {
                                    { n = G.UIT.T, config = { text = "2", colour = G.C.WHITE, scale = 0.75 } },
                                }
                            },
                            unpack(result.artists)
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { padding = 0.5 },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = 'cm' },
                                nodes = {
                                    { n = G.UIT.T, config = { text = "3", colour = G.C.WHITE, scale = 0.75 } },
                                }
                            },
                            unpack(result.coders)
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { padding = 0.5 },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = 'cm' },
                                nodes = {
                                    { n = G.UIT.T, config = { text = "4", colour = G.C.WHITE, scale = 0.75 } }
                                }
                            },
                            unpack(result.shaders)
                        }
                    }
                }
            }
        }
    }

    return { {
        label = "Credits",
        tab_definition_function = function()
            return credits_tab
        end
    }
    }
end
