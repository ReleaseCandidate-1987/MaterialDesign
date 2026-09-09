import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialTextArea-Komponente

    Stellt ein mehrzeiliges Texteingabefeld mit anpassbarem Hintergrund und Rahmen dar.

    properties:
        - backgroundOpacity: Legt die Deckkraft des Hintergrundes fest.
        - borderVisible: Legt fest, ob der Rahmen angezeigt wird.
        - radius: Legt die Rundung der Ecken fest.
*/
TextArea {
    id: control
    implicitWidth: 300
    height: 300
    topInset: 0
    font: MaterialTheme.controlFont
    bottomPadding: 0
    topPadding: 16
    Material.foreground: MaterialTheme.foreground
    Material.background: MaterialTheme.backgroundAlt
    Material.elevation: 8

    placeholderText: "MaterialTextArea"

    property real backgroundOpacity: 1
    property bool borderVisible: true
    property int radius: MaterialTheme.controlRadius

    Component.onCompleted: {
        let obj = children.find( c => c instanceof FloatingPlaceholderText )
        obj.destroy()
    }

    background: Rectangle {
        y: control.topInset
        width: control.width
        height: control.height - control.topPadding + control.bottomPadding

        radius: control.radius

        color: MaterialTheme.rgba(control.Material.backgroundColor, control.backgroundOpacity)
        border.color: MaterialTheme.border
        border.width: control.borderVisible ? 1 : 0

        layer.enabled: control.enabled && control.Material.elevation > 0
        layer.effect: RoundedElevationEffect {
            elevation: control.Material.elevation
            roundedScale: control.background.radius
        }
    }
}
