const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0E0703", /* black   */
  [1] = "#A15115", /* red     */
  [2] = "#D45F05", /* green   */
  [3] = "#907356", /* yellow  */
  [4] = "#F68D0C", /* blue    */
  [5] = "#D5C469", /* magenta */
  [6] = "#6E8F94", /* cyan    */
  [7] = "#cee1ed", /* white   */

  /* 8 bright colors */
  [8]  = "#909da5",  /* black   */
  [9]  = "#A15115",  /* red     */
  [10] = "#D45F05", /* green   */
  [11] = "#907356", /* yellow  */
  [12] = "#F68D0C", /* blue    */
  [13] = "#D5C469", /* magenta */
  [14] = "#6E8F94", /* cyan    */
  [15] = "#cee1ed", /* white   */

  /* special colors */
  [256] = "#0E0703", /* background */
  [257] = "#cee1ed", /* foreground */
  [258] = "#cee1ed",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
