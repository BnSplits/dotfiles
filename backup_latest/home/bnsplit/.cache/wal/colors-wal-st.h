const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0e1013", /* black   */
  [1] = "#665C54", /* red     */
  [2] = "#70655B", /* green   */
  [3] = "#766E61", /* yellow  */
  [4] = "#BE492A", /* blue    */
  [5] = "#867667", /* magenta */
  [6] = "#64A66C", /* cyan    */
  [7] = "#c2c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#59606d",  /* black   */
  [9]  = "#665C54",  /* red     */
  [10] = "#70655B", /* green   */
  [11] = "#766E61", /* yellow  */
  [12] = "#BE492A", /* blue    */
  [13] = "#867667", /* magenta */
  [14] = "#64A66C", /* cyan    */
  [15] = "#c2c3c4", /* white   */

  /* special colors */
  [256] = "#0e1013", /* background */
  [257] = "#c2c3c4", /* foreground */
  [258] = "#c2c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
