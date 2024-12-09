static const char norm_fg[] = "#e6d4fb";
static const char norm_bg[] = "#180f0e";
static const char norm_border[] = "#caaba6";

static const char sel_fg[] = "#e6d4fb";
static const char sel_bg[] = "#6f9dff";
static const char sel_border[] = "#e6d4fb";

static const char urg_fg[] = "#e6d4fb";
static const char urg_bg[] = "#e47263";
static const char urg_border[] = "#e47263";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
