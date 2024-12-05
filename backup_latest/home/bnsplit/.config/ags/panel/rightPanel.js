const myLabel = Widget.Label({
  label: "some example content",
});

Utils.interval(1000, () => {
  myLabel.label = Utils.exec("date");
});

export function rightPanel() {
  return Widget.Window({
    monitor: 0,
    visible: false,
    name: "right-panel",
    anchor: ["right", "top", "bottom"],
    child: myLabel,
  });
}
