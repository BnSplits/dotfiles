static const char norm_fg[] = "#c1c2c4";
static const char norm_bg[] = "#080E14";
static const char norm_border[] = "#58616b";

static const char sel_fg[] = "#c1c2c4";
static const char sel_bg[] = "#41953A";
static const char sel_border[] = "#c1c2c4";

static const char urg_fg[] = "#c1c2c4";
static const char urg_bg[] = "#4D6466";
static const char urg_border[] = "#4D6466";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
