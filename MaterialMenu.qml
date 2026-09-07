import QtQuick
import QtQuick.Controls.Material

Menu {
    id: control
    width: 230
    leftPadding: 8
    rightPadding: 8

    Material.elevation: 12

    property int radius: MaterialTheme.controlRadius

    background: MaterialFrame {
        anchors.fill: parent
        radius: control.radius
    }

    delegate: MaterialMenuItem { }
}
