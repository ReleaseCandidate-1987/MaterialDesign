import QtQuick
import QtQuick.Controls
import QtQuick.Effects

/*!
    MaterialRoundedImage-Komponente

    Stellt ein Bild mit abgerundeten Ecken und einem konfigurierbaren Rahmen dar.

    properties:
        - radius: Legt die Rundung der Bildecken fest.
        - borderColor: Legt die Farbe des Rahmens fest.
        - borderWidth: Legt die Breite des Rahmens fest.
        - padding: Legt den Abstand zwischen Bild und Komponentenrand fest.
        - source: Legt die Bildquelle fest.
        - cache: Legt fest, ob das Bild zwischengespeichert wird.
        - asynchronous: Legt fest, ob das Bild asynchron geladen wird.
        - fillMode: Legt fest, wie das Bild innerhalb der verfügbaren Fläche dargestellt wird.
*/
Item {
    id: control
    x: 1057
    y: 540
    width: 200
    height: 200

    property int radius: MaterialTheme.controlRadius
    property color borderColor: MaterialTheme.blue
    property int borderWidth: 1
    property int padding: 16
    property url source: ""
    property bool cache: true
    property bool asynchronous: false
    property int fillMode: Image.PreserveAspectFit

    Image {
        id: __img
        clip: true
        anchors.fill: parent
        anchors.margins: control.padding
        source: control.source
        cache: true
        asynchronous: control.asynchronous
        fillMode: control.fillMode
        layer.enabled: true
        layer.effect: MultiEffect {
            maskEnabled: true
            maskSource: __clipSource
            maskInverted: false
        }
    }

    Rectangle {
        id: __clipSource
        clip: true
        anchors.fill: parent
        anchors.margins: control.padding
        radius: control.radius
        layer.enabled: true
        visible: false
        antialiasing: true
    }

    Rectangle {
        id: __border
        visible: border.width > 0
        anchors.fill: parent
        anchors.margins: control.padding - 1
        color: MaterialTheme.transparent
        border.color: control.borderColor
        border.width: control.borderWidth
        radius: control.radius
    }
}
