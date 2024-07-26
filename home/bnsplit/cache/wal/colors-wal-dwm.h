static const char norm_fg[] = "#c1c1c1";
static const char norm_bg[] = "#0A0A08";
static const char norm_border[] = "#676755";

static const char sel_fg[] = "#c1c1c1";
static const char sel_bg[] = "#E51308";
static const char sel_border[] = "#c1c1c1";

static const char urg_fg[] = "#c1c1c1";
static const char urg_bg[] = "#9A1C13";
static const char urg_border[] = "#9A1C13";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
