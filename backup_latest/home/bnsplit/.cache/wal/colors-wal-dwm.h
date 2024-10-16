static const char norm_fg[] = "#c2c3c4";
static const char norm_bg[] = "#0e1013";
static const char norm_border[] = "#59606d";

static const char sel_fg[] = "#c2c3c4";
static const char sel_bg[] = "#70655B";
static const char sel_border[] = "#c2c3c4";

static const char urg_fg[] = "#c2c3c4";
static const char urg_bg[] = "#665C54";
static const char urg_border[] = "#665C54";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
