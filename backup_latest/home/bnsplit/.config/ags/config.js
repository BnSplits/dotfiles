import { NotificationPopups } from "./notification/notificationPopups.js";
import { rightPanel } from "./panels/rightPanel.js";
import { centerPanel } from "./panels/centerPanel.js";

// Utils.monitorFile(
//   `${App.configDir}`,
//
//   setInterval(() => {
//     const css = `${App.configDir}/style.css`;
//     App.applyCss(css);
//   }, 1000),
// );

Utils.interval(1000, () => {
  const css = `${App.configDir}/style.css`;
  App.applyCss(css);
});

App.config({
  style: "./style.css",
  windows: [NotificationPopups(), rightPanel(), centerPanel()],
});
