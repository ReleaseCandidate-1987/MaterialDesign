import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

/*!
    MaterialPopup-Komponente

    Stellt ein Popup mit abgedunkeltem Hintergrund und anpassbarer Eckenrundung dar.

    properties:
        - radius: Legt die Rundung der Popupecken fest.

    signals:
        - accepted: Wird ausgelöst, wenn der Inhalt des Popups bestätigt wurde.
*/
Popup {
    id: control
    padding: 16

    property int radius: MaterialTheme.controlRadius
    signal accepted

    background: MaterialFrame {
        width: control.width
        height: control.height
        Material.elevation: 12
        radius: control.radius
    }

    Overlay.modal: Rectangle {
        color: MaterialTheme.background
        opacity: 0.85
        Behavior on opacity { NumberAnimation { duration: 200; easing.type: "InOutQuad" } }
    }

    Overlay.modeless: Rectangle {
        color: MaterialTheme.background
        opacity: 0.85
        Behavior on opacity { NumberAnimation { duration: 200; easing.type: "InOutQuad"  } }
    }

    enter: Transition {
        NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
        NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }
}












