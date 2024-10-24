static const char norm_fg[] = "#bfbfc1";
static const char norm_bg[] = "#020209";
static const char norm_border[] = "#535365";

static const char sel_fg[] = "#bfbfc1";
static const char sel_bg[] = "#EA1608";
static const char sel_border[] = "#bfbfc1";

static const char urg_fg[] = "#bfbfc1";
static const char urg_bg[] = "#A42621";
static const char urg_border[] = "#A42621";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
