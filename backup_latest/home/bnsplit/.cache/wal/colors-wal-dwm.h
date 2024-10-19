static const char norm_fg[] = "#c4c5c2";
static const char norm_bg[] = "#16180d";
static const char norm_border[] = "#6b6e5a";

static const char sel_fg[] = "#c4c5c2";
static const char sel_bg[] = "#77846F";
static const char sel_border[] = "#c4c5c2";

static const char urg_fg[] = "#c4c5c2";
static const char urg_bg[] = "#96673C";
static const char urg_border[] = "#96673C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
