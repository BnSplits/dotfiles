const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d1215", /* black   */
  [1] = "#4F6467", /* red     */
  [2] = "#6E827A", /* green   */
  [3] = "#1F728C", /* yellow  */
  [4] = "#497595", /* blue    */
  [5] = "#2B93AA", /* magenta */
  [6] = "#49AABE", /* cyan    */
  [7] = "#c2c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#59656d",  /* black   */
  [9]  = "#4F6467",  /* red     */
  [10] = "#6E827A", /* green   */
  [11] = "#1F728C", /* yellow  */
  [12] = "#497595", /* blue    */
  [13] = "#2B93AA", /* magenta */
  [14] = "#49AABE", /* cyan    */
  [15] = "#c2c3c4", /* white   */

  /* special colors */
  [256] = "#0d1215", /* background */
  [257] = "#c2c3c4", /* foreground */
  [258] = "#c2c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
