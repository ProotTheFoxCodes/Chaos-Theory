ChaosTheory.C = {
    CBLUE = HEX('3f63ff'),
    CRED = HEX('ff3f3f'),
    CYELLOW = HEX('ffa13f'),
    CGREEN = HEX('3fff5e'),
    CPINK = HEX('ff57c9')
}
SMODS.Gradient{
    key = "chaos",
    colours = {
        ChaosTheory.C.CBLUE,
        ChaosTheory.C.CRED,
        ChaosTheory.C.CYELLOW,
        ChaosTheory.C.CGREEN,
    },
    cycle = 4,
    interpolation = 'trig',
}

local dark = 0.2
SMODS.Gradient{
    key = "chaos_infoQ",
    colours = {
        darken(ChaosTheory.C.CBLUE, dark),
        darken(ChaosTheory.C.CRED, dark),
        darken(ChaosTheory.C.CYELLOW, dark),
        darken(ChaosTheory.C.CGREEN, dark),
    },
    cycle = 8,
    interpolation = 'trig',
}
G.ARGS.LOC_COLOURS.chat_cblue = ChaosTheory.C.CBLUE
G.ARGS.LOC_COLOURS.chat_cred = ChaosTheory.C.CRED
G.ARGS.LOC_COLOURS.chat_cyellow = ChaosTheory.C.CYELLOW
G.ARGS.LOC_COLOURS.chat_cgreen = ChaosTheory.C.CGREEN
G.ARGS.LOC_COLOURS.chat_cpink = ChaosTheory.C.CPINK
ChaosTheory.C.CHAOS_C = SMODS.Gradients["chat_chaos"]
G.ARGS.LOC_COLOURS.chat_chao = ChaosTheory.C.CHAOS_C