const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#080E14", /* black   */
  [1] = "#4D6466", /* red     */
  [2] = "#41953A", /* green   */
  [3] = "#369561", /* yellow  */
  [4] = "#4FA063", /* blue    */
  [5] = "#74AC7B", /* magenta */
  [6] = "#5ECB63", /* cyan    */
  [7] = "#c1c2c4", /* white   */

  /* 8 bright colors */
  [8]  = "#58616b",  /* black   */
  [9]  = "#4D6466",  /* red     */
  [10] = "#41953A", /* green   */
  [11] = "#369561", /* yellow  */
  [12] = "#4FA063", /* blue    */
  [13] = "#74AC7B", /* magenta */
  [14] = "#5ECB63", /* cyan    */
  [15] = "#c1c2c4", /* white   */

  /* special colors */
  [256] = "#080E14", /* background */
  [257] = "#c1c2c4", /* foreground */
  [258] = "#c1c2c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
