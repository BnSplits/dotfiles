const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#180f0e", /* black   */
  [1] = "#e47165", /* red     */
  [2] = "#8f85f9", /* green   */
  [3] = "#e472c5", /* yellow  */
  [4] = "#71b3bc", /* blue    */
  [5] = "#77afea", /* magenta */
  [6] = "#83e280", /* cyan    */
  [7] = "#89f3d4", /* white   */

  /* 8 bright colors */
  [8]  = "#caaba7",  /* black   */
  [9]  = "#e9857a",  /* red     */
  [10] = "#9d96fb", /* green   */
  [11] = "#ea86cd", /* yellow  */
  [12] = "#86bdc5", /* blue    */
  [13] = "#8abaed", /* magenta */
  [14] = "#96e692", /* cyan    */
  [15] = "#9cf4da", /* white   */

  /* special colors */
  [256] = "#180f0e", /* background */
  [257] = "#f9d5d0", /* foreground */
  [258] = "#f1dedc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
