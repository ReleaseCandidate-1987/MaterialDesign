import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialMenuItem-Komponente

    Stellt einen Menüeintrag im Material-Design mit angepasster
    Hervorhebung für Hover-, Fokus- und Auswahlzustände dar.
*/
MenuItem {
    id: control
    implicitHeight: visible ? MaterialTheme.controlHeight : 0
    text: "Desktop"

    topPadding: 0
    bottomPadding: 0
    leftPadding: 8
    rightPadding: 8

    icon.width: 16
    icon.height: 16
    font: MaterialTheme.controlFont
    Material.foreground: MaterialTheme.foreground

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.Material.menuItemHeight
        color: control.highlighted ? MaterialTheme.rgba(MaterialTheme.accent, 0.15) : "transparent"
        Ripple {
            width: parent.width
            height: parent.height

            clip: visible
            pressed: control.pressed
            anchor: control
            active: control.down || control.highlighted
            color: MaterialTheme.rgba(MaterialTheme.accent, 0.15)
        }
    }
}
