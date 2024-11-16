static const char norm_fg[] = "#c5c5c5";
static const char norm_bg[] = "#191918";
static const char norm_border[] = "#72725e";

static const char sel_fg[] = "#c5c5c5";
static const char sel_bg[] = "#B46C87";
static const char sel_border[] = "#c5c5c5";

static const char urg_fg[] = "#c5c5c5";
static const char urg_bg[] = "#A89071";
static const char urg_border[] = "#A89071";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
