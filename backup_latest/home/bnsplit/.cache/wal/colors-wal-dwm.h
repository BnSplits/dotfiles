static const char norm_fg[] = "#cadedd";
static const char norm_bg[] = "#111418";
static const char norm_border[] = "#a9b4c5";

static const char sel_fg[] = "#cadedd";
static const char sel_bg[] = "#7ab6f8";
static const char sel_border[] = "#cadedd";

static const char urg_fg[] = "#cadedd";
static const char urg_bg[] = "#af9ffe";
static const char urg_border[] = "#af9ffe";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
