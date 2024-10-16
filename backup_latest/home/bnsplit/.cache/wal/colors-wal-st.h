const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0705", /* black   */
  [1] = "#5F5027", /* red     */
  [2] = "#344B43", /* green   */
  [3] = "#525253", /* yellow  */
  [4] = "#8E3616", /* blue    */
  [5] = "#9F5519", /* magenta */
  [6] = "#BF6B2D", /* cyan    */
  [7] = "#c2c1c0", /* white   */

  /* 8 bright colors */
  [8]  = "#675855",  /* black   */
  [9]  = "#5F5027",  /* red     */
  [10] = "#344B43", /* green   */
  [11] = "#525253", /* yellow  */
  [12] = "#8E3616", /* blue    */
  [13] = "#9F5519", /* magenta */
  [14] = "#BF6B2D", /* cyan    */
  [15] = "#c2c1c0", /* white   */

  /* special colors */
  [256] = "#0d0705", /* background */
  [257] = "#c2c1c0", /* foreground */
  [258] = "#c2c1c0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
