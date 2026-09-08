import QtQuick
import QtQuick.Controls.Material

Menu {
    id: control
    width: 230
    leftPadding: 8
    rightPadding: 8

    Material.elevation: 12
    Material.foreground: MaterialTheme.foreground
    Material.accent: MaterialTheme.accent
    property int radius: MaterialTheme.controlRadius

    background: MaterialFrame {
        anchors.fill: parent
        radius: control.radius
    }

    delegate: MaterialMenuItem { }
}
