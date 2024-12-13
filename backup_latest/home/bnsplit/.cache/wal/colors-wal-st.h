const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#180f0e", /* black   */
  [1] = "#fb7e6c", /* red     */
  [2] = "#ff7d97", /* green   */
  [3] = "#d88aff", /* yellow  */
  [4] = "#ff86e1", /* blue    */
  [5] = "#ffa776", /* magenta */
  [6] = "#febf7a", /* cyan    */
  [7] = "#f9ef8b", /* white   */

  /* 8 bright colors */
  [8]  = "#caaba6",  /* black   */
  [9]  = "#fe9080",  /* red     */
  [10] = "#ff8fa5", /* green   */
  [11] = "#de9aff", /* yellow  */
  [12] = "#ff97e5", /* blue    */
  [13] = "#ffb38a", /* magenta */
  [14] = "#ffc88e", /* cyan    */
  [15] = "#faf19d", /* white   */

  /* special colors */
  [256] = "#180f0e", /* background */
  [257] = "#f9d5cf", /* foreground */
  [258] = "#f1dfdb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
