const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#180f0d", /* black   */
  [1] = "#e78a73", /* red     */
  [2] = "#9eae9b", /* green   */
  [3] = "#79c1a0", /* yellow  */
  [4] = "#eaa778", /* blue    */
  [5] = "#e1b77e", /* magenta */
  [6] = "#d8ebb2", /* cyan    */
  [7] = "#f3e6c6", /* white   */

  /* 8 bright colors */
  [8]  = "#caaca4",  /* black   */
  [9]  = "#ec9a86",  /* red     */
  [10] = "#abb8a8", /* green   */
  [11] = "#8cc9ad", /* yellow  */
  [12] = "#edb28b", /* blue    */
  [13] = "#e5c090", /* magenta */
  [14] = "#ddedbd", /* cyan    */
  [15] = "#f4e9ce", /* white   */

  /* special colors */
  [256] = "#180f0d", /* background */
  [257] = "#f9d6cc", /* foreground */
  [258] = "#f1dfda",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
