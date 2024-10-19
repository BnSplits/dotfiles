const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#16180d", /* black   */
  [1] = "#96673C", /* red     */
  [2] = "#77846F", /* green   */
  [3] = "#A18F72", /* yellow  */
  [4] = "#CF974C", /* blue    */
  [5] = "#B3A58A", /* magenta */
  [6] = "#CBB595", /* cyan    */
  [7] = "#c4c5c2", /* white   */

  /* 8 bright colors */
  [8]  = "#6b6e5a",  /* black   */
  [9]  = "#96673C",  /* red     */
  [10] = "#77846F", /* green   */
  [11] = "#A18F72", /* yellow  */
  [12] = "#CF974C", /* blue    */
  [13] = "#B3A58A", /* magenta */
  [14] = "#CBB595", /* cyan    */
  [15] = "#c4c5c2", /* white   */

  /* special colors */
  [256] = "#16180d", /* background */
  [257] = "#c4c5c2", /* foreground */
  [258] = "#c4c5c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
