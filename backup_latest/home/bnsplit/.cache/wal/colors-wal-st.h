const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#020209", /* black   */
  [1] = "#A42621", /* red     */
  [2] = "#EA1608", /* green   */
  [3] = "#DD2014", /* yellow  */
  [4] = "#EC5829", /* blue    */
  [5] = "#BE9771", /* magenta */
  [6] = "#719591", /* cyan    */
  [7] = "#bfbfc1", /* white   */

  /* 8 bright colors */
  [8]  = "#535365",  /* black   */
  [9]  = "#A42621",  /* red     */
  [10] = "#EA1608", /* green   */
  [11] = "#DD2014", /* yellow  */
  [12] = "#EC5829", /* blue    */
  [13] = "#BE9771", /* magenta */
  [14] = "#719591", /* cyan    */
  [15] = "#bfbfc1", /* white   */

  /* special colors */
  [256] = "#020209", /* background */
  [257] = "#bfbfc1", /* foreground */
  [258] = "#bfbfc1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
