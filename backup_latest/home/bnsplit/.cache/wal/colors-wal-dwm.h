static const char norm_fg[] = "#b0f4e7";
static const char norm_bg[] = "#101510";
static const char norm_border[] = "#a5b8a6";

static const char sel_fg[] = "#b0f4e7";
static const char sel_bg[] = "#8fbbf8";
static const char sel_border[] = "#b0f4e7";

static const char urg_fg[] = "#b0f4e7";
static const char urg_bg[] = "#95adfc";
static const char urg_border[] = "#95adfc";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
