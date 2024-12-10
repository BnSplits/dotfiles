const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101510", /* black   */
  [1] = "#95adfc", /* red     */
  [2] = "#8fbbf8", /* green   */
  [3] = "#88d39b", /* yellow  */
  [4] = "#8ccbf5", /* blue    */
  [5] = "#9cdee9", /* magenta */
  [6] = "#97e5c3", /* cyan    */
  [7] = "#a3f2e5", /* white   */

  /* 8 bright colors */
  [8]  = "#a5b8a6",  /* black   */
  [9]  = "#a2b8fc",  /* red     */
  [10] = "#9dc4f9", /* green   */
  [11] = "#98d9a7", /* yellow  */
  [12] = "#9cd2f6", /* blue    */
  [13] = "#aae2eb", /* magenta */
  [14] = "#a5e8ca", /* cyan    */
  [15] = "#b0f4e7", /* white   */

  /* special colors */
  [256] = "#101510", /* background */
  [257] = "#cde2ce", /* foreground */
  [258] = "#dfe4dc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
