static const char norm_fg[] = "#c2c3c4";
static const char norm_bg[] = "#0d1215";
static const char norm_border[] = "#59656d";

static const char sel_fg[] = "#c2c3c4";
static const char sel_bg[] = "#6E827A";
static const char sel_border[] = "#c2c3c4";

static const char urg_fg[] = "#c2c3c4";
static const char urg_bg[] = "#4F6467";
static const char urg_border[] = "#4F6467";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
