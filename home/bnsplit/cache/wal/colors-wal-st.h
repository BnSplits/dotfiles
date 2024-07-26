const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0A0A08", /* black   */
  [1] = "#9A1C13", /* red     */
  [2] = "#E51308", /* green   */
  [3] = "#B9593B", /* yellow  */
  [4] = "#D29453", /* blue    */
  [5] = "#3853AD", /* magenta */
  [6] = "#1B62D3", /* cyan    */
  [7] = "#c1c1c1", /* white   */

  /* 8 bright colors */
  [8]  = "#676755",  /* black   */
  [9]  = "#9A1C13",  /* red     */
  [10] = "#E51308", /* green   */
  [11] = "#B9593B", /* yellow  */
  [12] = "#D29453", /* blue    */
  [13] = "#3853AD", /* magenta */
  [14] = "#1B62D3", /* cyan    */
  [15] = "#c1c1c1", /* white   */

  /* special colors */
  [256] = "#0A0A08", /* background */
  [257] = "#c1c1c1", /* foreground */
  [258] = "#c1c1c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
