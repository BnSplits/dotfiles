const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0B1011", /* black   */
  [1] = "#324A2F", /* red     */
  [2] = "#545233", /* green   */
  [3] = "#2D3944", /* yellow  */
  [4] = "#37484D", /* blue    */
  [5] = "#5A5C54", /* magenta */
  [6] = "#817951", /* cyan    */
  [7] = "#c2c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#58666b",  /* black   */
  [9]  = "#324A2F",  /* red     */
  [10] = "#545233", /* green   */
  [11] = "#2D3944", /* yellow  */
  [12] = "#37484D", /* blue    */
  [13] = "#5A5C54", /* magenta */
  [14] = "#817951", /* cyan    */
  [15] = "#c2c3c3", /* white   */

  /* special colors */
  [256] = "#0B1011", /* background */
  [257] = "#c2c3c3", /* foreground */
  [258] = "#c2c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
