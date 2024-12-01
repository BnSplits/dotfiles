const myLabel = Widget.Label({
  label: "some example content",
});

//
const wifiBtn = Widget.Button({
    child: Widget.Label('click me!'),
    onClicked: () => Utils.execAsync(['notify-send','!','Toggle Save Battery Mode!'])
    .then(out => print(out))
    .catch(err => print(err))
})
//
// const calendar = Widget.Calendar({
//     showDayNames: true,
//     showDetails: false,
//     showHeading: true,
//     showWeekNumbers: true,
//     detail: (self, y, m, d) => {
//         return `<span color="white">${y}. ${m}. ${d}.</span>`
//     },
//     onDaySelected: ({ date: [y, m, d] }) => {
//         print(`${y}. ${m}. ${d}.`)
//     },
// })

Utils.interval(1000, () => {
  myLabel.label = Utils.exec("date");
});

export function rightPanel() {
  return Widget.Window({
    monitor: 0,
    visible: false,
    name: "right-panel",
    // exclusivity : "exclusive",
    anchor: ["right", "top", "bottom"],
    child: wifiBtn,
  });
}
