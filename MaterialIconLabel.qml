import QtQuick
import QtQuick.Controls.impl

/*!
    MaterialIconLabel-Komponente

    Kombiniert Text und Icon im Material-Design und ermöglicht
    das Einsetzen eines eigenen Hintergrundelements.

    properties:
        - background: Legt das Hintergrundelement der Komponente fest.
*/
IconLabel {
    id: control
    text: "IconLabel"
    font: MaterialTheme.controlFont
    color: MaterialTheme.foreground

    icon.color: MaterialTheme.foreground
    icon.width: 24
    icon.height: 24
    spacing: 8

    property Item background: contentHost

    onBackgroundChanged: {
        if ( background === contentHost )
            return;

        background.parent = contentHost;
        background.anchors.fill = contentHost;
    }

    Item {
        id: contentHost
        anchors.fill: parent
        z: -1
    }
}
