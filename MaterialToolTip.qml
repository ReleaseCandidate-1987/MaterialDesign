import QtQuick
import QtQuick.Controls

ToolTip {
    enum Position {
        PositionLeft,
        PositionRight,
        PositionTop,
        PositionBottom
    }

    property int position: MaterialToolTip.PositionLeft
    enabled: control.enabled && control.visible && control.toolTipText.trim().length > 0
    visible: enabled && control.hovered
    text: control.toolTipText
    y: position === MaterialToolTip.PositionLeft ||
       position === MaterialToolTip.PositionRight
       ? (control.height - height ) / 2
       : position === MaterialToolTip.PositionTop
         ? -height -8 : control.height + 8

    x: position === MaterialToolTip.PositionTop ||
       position === MaterialToolTip.PositionBottom
       ? ( control.width - width  ) / 2
       : position === MaterialToolTip.PositionLeft
         ? -width - 8 : control.width + 8


    delay: 500
    timeout: 2000
    background: MaterialFrame {
        anchors.fill: parent
        radius: MaterialTheme.controlRadius
        Material.background: MaterialTheme.backgroundElevated
    }
}
