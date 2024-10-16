static const char norm_fg[] = "#c2c1c0";
static const char norm_bg[] = "#0d0705";
static const char norm_border[] = "#675855";

static const char sel_fg[] = "#c2c1c0";
static const char sel_bg[] = "#344B43";
static const char sel_border[] = "#c2c1c0";

static const char urg_fg[] = "#c2c1c0";
static const char urg_bg[] = "#5F5027";
static const char urg_border[] = "#5F5027";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
