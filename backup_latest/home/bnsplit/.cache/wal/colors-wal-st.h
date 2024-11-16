const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#191918", /* black   */
  [1] = "#A89071", /* red     */
  [2] = "#B46C87", /* green   */
  [3] = "#568C89", /* yellow  */
  [4] = "#A0A390", /* blue    */
  [5] = "#D29E98", /* magenta */
  [6] = "#B7C5A6", /* cyan    */
  [7] = "#c5c5c5", /* white   */

  /* 8 bright colors */
  [8]  = "#72725e",  /* black   */
  [9]  = "#A89071",  /* red     */
  [10] = "#B46C87", /* green   */
  [11] = "#568C89", /* yellow  */
  [12] = "#A0A390", /* blue    */
  [13] = "#D29E98", /* magenta */
  [14] = "#B7C5A6", /* cyan    */
  [15] = "#c5c5c5", /* white   */

  /* special colors */
  [256] = "#191918", /* background */
  [257] = "#c5c5c5", /* foreground */
  [258] = "#c5c5c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
