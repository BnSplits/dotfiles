static const char norm_fg[] = "#c2c3c3";
static const char norm_bg[] = "#0B1011";
static const char norm_border[] = "#58666b";

static const char sel_fg[] = "#c2c3c3";
static const char sel_bg[] = "#545233";
static const char sel_border[] = "#c2c3c3";

static const char urg_fg[] = "#c2c3c3";
static const char urg_bg[] = "#324A2F";
static const char urg_border[] = "#324A2F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
