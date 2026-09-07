import QtQuick
import QtQuick.Controls.Material

/*!
    MaterialLabel-Komponente

    Erweitert das standardmäßige Label um einen optionalen Hintergrund
    und einen individuell konfigurierbaren Rahmen.

    properties:
        - backgroundVisible: Legt fest, ob der Hintergrund angezeigt wird.
        - backgroundColor: Legt die Farbe des Hintergrunds fest.
        - backgroundRadius: Legt den Eckenradius des Hintergrunds fest.
        - backgroundOpacity: Legt die Deckkraft des Hintergrunds fest.
        - borderColor: Legt die Farbe des Rahmens fest.
        - borderWidth: Legt die Breite des Rahmens fest.
*/
Label {
    id: control
    text: "MaterialLabel"
    font: MaterialTheme.controlFont
    Material.foreground: MaterialTheme.foreground

    leftPadding: backgroundVisible ? 16 : 0
    rightPadding: backgroundVisible ? 16 : 0
    topPadding: backgroundVisible ? 8 : 0
    bottomPadding: backgroundVisible ? 8 : 0

    property bool backgroundVisible: true
    property color backgroundColor: MaterialTheme.backgroundAlt
    property int backgroundRadius: MaterialTheme.controlRadius
    property real backgroundOpacity: 1.0

    property color borderColor: MaterialTheme.border
    property int borderWidth: 1

    background: Loader {
        active: control.backgroundVisible
        sourceComponent: backgroundComponent
    }

    Component {
        id: backgroundComponent
        Item {
            Rectangle {
                anchors.fill: parent
                color: control.backgroundColor
                radius: control.backgroundRadius
                opacity: control.backgroundOpacity
            }

            Rectangle {
                visible: border.width > 0
                anchors.fill: parent
                color: MaterialTheme.transparent
                radius: control.backgroundRadius
                border.color: control.borderColor
                border.width: control.borderWidth
            }
        }
    }
}
