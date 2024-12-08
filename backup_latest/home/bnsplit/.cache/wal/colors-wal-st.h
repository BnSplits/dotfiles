const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#111418", /* black   */
  [1] = "#af9ffe", /* red     */
  [2] = "#7ab6f8", /* green   */
  [3] = "#7ec0de", /* yellow  */
  [4] = "#dfa6ef", /* blue    */
  [5] = "#edb686", /* magenta */
  [6] = "#f6bbc5", /* cyan    */
  [7] = "#c2dad8", /* white   */

  /* 8 bright colors */
  [8]  = "#a9b4c5",  /* black   */
  [9]  = "#b9acff",  /* red     */
  [10] = "#8cc0f9", /* green   */
  [11] = "#91c9e3", /* yellow  */
  [12] = "#e3b2f2", /* blue    */
  [13] = "#f0c097", /* magenta */
  [14] = "#f7c3cd", /* cyan    */
  [15] = "#cadedd", /* white   */

  /* special colors */
  [256] = "#111418", /* background */
  [257] = "#d2ddf2", /* foreground */
  [258] = "#e1e2e8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
