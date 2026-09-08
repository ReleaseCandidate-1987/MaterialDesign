import QtQuick
import QtQuick.Effects

/*!
    MaterialTransparentBackground-Komponente

    Stellt einen karierten Hintergrund zur Kennzeichnung transparenter Flächen dar.

    properties:
        - radius: Legt die Rundung der Hintergrundecken fest.
        - tileSize: Legt die Größe der einzelnen Kacheln fest.
*/
Item {
    id: control
    width: 300
    height: 300
    visible: opacity > 0
    Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }

    property int radius: MaterialTheme.controlRadius
    property int tileSize: MaterialTheme.controlHeight

    Rectangle {
        id: clipRect
        anchors.fill: parent
        radius: control.radius
        visible: false
        layer.enabled: true
    }

    Image {
        clip: true
        anchors.fill: parent

        source: `data:image/svg+xml,
        <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
        <rect width="64" height="64" fill="#ffffff"/>
        <rect x="32" width="32" height="32" fill="#c8c8c8"/>
        <rect y="32" width="32" height="32" fill="#c8c8c8"/>
        </svg>
        `
        sourceSize: Qt.size(control.tileSize, control.tileSize)
        fillMode: Image.Tile
        visible: true
        layer.enabled: true
        layer.effect: MultiEffect {
            anchors.fill: parent
            maskEnabled: true
            maskInverted: false
            maskSource: clipRect
        }
    }
}
