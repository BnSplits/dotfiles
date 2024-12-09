const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#180f0e", /* black   */
  [1] = "#e47263", /* red     */
  [2] = "#6f9dff", /* green   */
  [3] = "#9db5b3", /* yellow  */
  [4] = "#7bc6f8", /* blue    */
  [5] = "#fdb1d5", /* magenta */
  [6] = "#e6d4a7", /* cyan    */
  [7] = "#e2cefa", /* white   */

  /* 8 bright colors */
  [8]  = "#caaba6",  /* black   */
  [9]  = "#e98678",  /* red     */
  [10] = "#82aaff", /* green   */
  [11] = "#aabebd", /* yellow  */
  [12] = "#8fcef9", /* blue    */
  [13] = "#febbdb", /* magenta */
  [14] = "#eadab3", /* cyan    */
  [15] = "#e6d4fb", /* white   */

  /* special colors */
  [256] = "#180f0e", /* background */
  [257] = "#f9d5cf", /* foreground */
  [258] = "#f1dfdc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
