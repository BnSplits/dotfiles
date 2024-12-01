const notifications = await Service.import("notifications")

const myLabel = Widget.Label({
  label: "some example content",
});

Utils.interval(1000, () => {
  myLabel.label = Utils.exec("date");
});

export function centerPanel() {
  return Widget.Window({
    monitor: 0,
    visible: false,
    name: "center-panel",
    anchor: ["top"],
    child: myLabel,
  });
}
