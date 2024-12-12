static const char norm_fg[] = "#9cf4da";
static const char norm_bg[] = "#180f0e";
static const char norm_border[] = "#caaba7";

static const char sel_fg[] = "#9cf4da";
static const char sel_bg[] = "#8f85f9";
static const char sel_border[] = "#9cf4da";

static const char urg_fg[] = "#9cf4da";
static const char urg_bg[] = "#e47165";
static const char urg_border[] = "#e47165";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
