static const char norm_fg[] = "#faf19d";
static const char norm_bg[] = "#180f0e";
static const char norm_border[] = "#caaba6";

static const char sel_fg[] = "#faf19d";
static const char sel_bg[] = "#ff7d97";
static const char sel_border[] = "#faf19d";

static const char urg_fg[] = "#faf19d";
static const char urg_bg[] = "#fb7e6c";
static const char urg_border[] = "#fb7e6c";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
