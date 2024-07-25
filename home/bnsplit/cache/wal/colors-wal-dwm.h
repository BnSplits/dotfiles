static const char norm_fg[] = "#cee1ed";
static const char norm_bg[] = "#0E0703";
static const char norm_border[] = "#909da5";

static const char sel_fg[] = "#cee1ed";
static const char sel_bg[] = "#D45F05";
static const char sel_border[] = "#cee1ed";

static const char urg_fg[] = "#cee1ed";
static const char urg_bg[] = "#A15115";
static const char urg_border[] = "#A15115";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
