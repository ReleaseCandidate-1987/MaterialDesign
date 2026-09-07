import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialFrame-Komponente

    Erweitert den standardmäßigen Frame um einen abgerundeten,
    transparenten Hintergrund mit Material-Schatten.

    properties:
        - radius: Legt den Eckenradius des Hintergrunds fest.
        - backgroundOpacity: Legt die Deckkraft des Hintergrunds fest.
*/
Frame {
    id: control
    bottomPadding: 0
    topPadding: 0
    padding: 0
    height: 200
    width: 200

    visible: opacity > 0
    enabled: visible

    Material.elevation: 4
    Material.background: MaterialTheme.background

    property int radius: 0
    property real backgroundOpacity: 0.85

    Behavior on radius { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }

    background: Rectangle {
        color: control.Material.backgroundColor
        radius: control.radius
        opacity: control.backgroundOpacity

        layer.enabled: control.enabled && control.Material.elevation > 0
        layer.effect: RoundedElevationEffect {
            elevation: control.Material.elevation
            roundedScale: control.background.radius
        }
    }
}
