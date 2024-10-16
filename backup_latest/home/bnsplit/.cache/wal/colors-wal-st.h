const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#120d16", /* black   */
  [1] = "#254EA3", /* red     */
  [2] = "#3452AA", /* green   */
  [3] = "#505EAD", /* yellow  */
  [4] = "#6174C3", /* blue    */
  [5] = "#877AB4", /* magenta */
  [6] = "#CBADBA", /* cyan    */
  [7] = "#c3c2c4", /* white   */

  /* 8 bright colors */
  [8]  = "#63596e",  /* black   */
  [9]  = "#254EA3",  /* red     */
  [10] = "#3452AA", /* green   */
  [11] = "#505EAD", /* yellow  */
  [12] = "#6174C3", /* blue    */
  [13] = "#877AB4", /* magenta */
  [14] = "#CBADBA", /* cyan    */
  [15] = "#c3c2c4", /* white   */

  /* special colors */
  [256] = "#120d16", /* background */
  [257] = "#c3c2c4", /* foreground */
  [258] = "#c3c2c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
