import QtQuick
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Effects

/*!
    MaterialColorImage-Komponente

    Stellt ein farblich anpassbares Bild mit Unschärfe-, Helligkeits-
    und Schatteneffekten dar.

    properties:
        - source: Legt die Bildquelle fest.
        - color: Legt die Farbe des Bildes fest.
        - cache: Legt fest, ob das Bild zwischengespeichert wird.
        - asynchronous: Legt fest, ob das Bild asynchron geladen wird.
        - padding: Legt den inneren Abstand des Bildes fest.
        - mirror: Legt fest, ob das Bild gespiegelt wird.
        - mipmap: Legt fest, ob Mipmapping verwendet wird.
        - blur: Legt die Stärke der Unschärfe fest.
        - brightness: Legt die Helligkeit des Bildes fest.
        - shadowEnabled: Legt fest, ob der Schatten angezeigt wird.
        - shadowBlur: Legt die Unschärfe des Schattens fest.
        - shadowColor: Legt die Farbe des Schattens fest.
        - shadowScale: Legt die Skalierung des Schattens fest.
        - shadowOpacity: Legt die Deckkraft des Schattens fest.
        - shadowHorizontalOffset: Legt die horizontale Verschiebung des Schattens fest.
        - shadowVerticalOffset: Legt die vertikale Verschiebung des Schattens fest.
*/
Item {
    id: control
    height: MaterialTheme.controlHeight
    width: height

    property url source: ""
    property color color: MaterialTheme.foreground
    property bool cache: true
    property bool asynchronous: false
    property int padding: 0
    property bool mirror: false
    property bool mipmap: false
    property real blur: 0
    property real brightness: 0

    property bool shadowEnabled: true
    property real shadowBlur: 1
    property color shadowColor: "black"
    property real shadowScale: 1
    property real shadowOpacity: 1
    property real shadowHorizontalOffset: 0
    property real shadowVerticalOffset: 0

    ColorImage {
        id: __img
        anchors.fill: parent
        anchors.margins: control.padding
        color: control.color
        asynchronous: control.asynchronous
        cache: control.cache
        mirror: control.mirror
        mipmap: control.mipmap
        source: control.source
        sourceSize: Qt.size(width, height)
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowBlur: control.shadowBlur
            shadowColor: control.shadowColor
            shadowEnabled: control.shadowEnabled
            shadowScale: control.shadowScale
            shadowOpacity: control.shadowOpacity
            shadowHorizontalOffset: control.shadowHorizontalOffset
            shadowVerticalOffset: control.shadowVerticalOffset
            brightness: control.brightness
            blurEnabled: blur > 0
            blur: Math.max(0, Math.min( 2.0, control.blur ) )
        }

    }
}




















