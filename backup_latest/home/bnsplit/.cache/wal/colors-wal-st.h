const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0d0d", /* black   */
  [1] = "#605555", /* red     */
  [2] = "#9A0E1E", /* green   */
  [3] = "#A70F1E", /* yellow  */
  [4] = "#A51C29", /* blue    */
  [5] = "#CC4A58", /* magenta */
  [6] = "#CA8E6C", /* cyan    */
  [7] = "#c2c2c2", /* white   */

  /* 8 bright colors */
  [8]  = "#6a5757",  /* black   */
  [9]  = "#605555",  /* red     */
  [10] = "#9A0E1E", /* green   */
  [11] = "#A70F1E", /* yellow  */
  [12] = "#A51C29", /* blue    */
  [13] = "#CC4A58", /* magenta */
  [14] = "#CA8E6C", /* cyan    */
  [15] = "#c2c2c2", /* white   */

  /* special colors */
  [256] = "#0d0d0d", /* background */
  [257] = "#c2c2c2", /* foreground */
  [258] = "#c2c2c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
