import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialGroupBox-Komponente

    Stellt einen beschrifteten Container zum übersichtlichen Gruppieren zusammengehöriger Inhalte dar.

    properties:
        - backgroundOpacity: Legt die Deckkraft des Hintergrundes fest.
        - borderVisible: Legt fest, ob der Rahmen angezeigt wird.
        - radius: Legt die Rundung der Containerecken fest.
*/
GroupBox {
    id: control
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0
    title: "MaterialGroupBox"
    font: MaterialTheme.mediumFontBold
    spacing: 0
    topInset: metric.lineSpacing + 4 + spacing
    topPadding:  topInset
    Material.foreground: MaterialTheme.foreground
    Material.background: MaterialTheme.backgroundAlt
    Material.elevation: 8

    FontMetrics {
        id: metric
        font: control.font
    }

    property real backgroundOpacity: 1
    property bool borderVisible: true
    property int radius: MaterialTheme.controlRadius

    label: MaterialLabel {
        x: Math.max(control.leftPadding, control.Material.roundedScale)
        width: control.availableWidth
        text: control.title
        font: control.font
        color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        y: control.topPadding - control.bottomPadding
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



