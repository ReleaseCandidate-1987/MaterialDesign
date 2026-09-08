import QtQuick
import QtQuick.Controls.Material

/*!
    MaterialRadioButton-Komponente

    Erweitert den standardmäßigen RadioButton um eine zusätzliche Überschrift
    und getrennt konfigurierbare Darstellungen für Überschrift und Text.

    properties:
        - title: Legt den Text der Überschrift fest.
        - titleFont: Legt die Schriftart der Überschrift fest.
        - titleColor: Legt die Farbe der Überschrift fest.
        - titleVisible: Legt fest, ob die Überschrift sichtbar ist.
        - titleOpacity: Legt die Deckkraft der Überschrift fest.
        - textColor: Legt die Farbe des Textes fest.
        - textVisible: Legt fest, ob der Text sichtbar ist.
        - textOpacity: Legt die Deckkraft des Textes fest.
*/
RadioButton {
    id: control
    text: "Text"
    implicitHeight: MaterialTheme.controlHeight
    bottomPadding: 0
    topPadding: 0
    rightPadding: 0
    leftPadding: 0
    font: MaterialTheme.controlFont
    LayoutMirroring.enabled: true
    Material.foreground: MaterialTheme.foreground
    Material.background: MaterialTheme.background
    Material.accent: MaterialTheme.accent
    spacing: 16

    property string title: "Title"
    property alias titleFont: __lbl.titleFont
    property alias titleColor: __lbl.titleColor
    property alias titleVisible: __lbl.titleVisible
    property alias titleOpacity: __lbl.titleOpacity
    property alias textColor: __lbl.textColor
    property alias textVisible: __lbl.textVisible
    property alias textOpacity: __lbl.textOpacity

    implicitWidth: __lbl.implicitWidth + indicator.width + spacing + leftPadding + rightPadding

    contentItem: Item {
        anchors.fill: parent
        MaterialTitleLabel {
            id: __lbl
            title: control.title
            text: control.text
            spacing: 0
            font: control.font
            x: !control.mirrored ? control.indicator.width + control.spacing : 0
            y: (control.height - height) / 2
        }
    }

    indicator: Item {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        height: control.implicitHeight * 0.8
        width: height
        Rectangle {
            width: parent.width * 0.6
            height: parent.height * 0.6
            anchors.centerIn: parent
            radius: Math.max(width, height) / 2
            color: control.Material.accent
            scale: control.checked ? 1 : 0
            opacity: control.checked ? 1 : 0
            Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
            Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        }

        Rectangle {
            anchors.fill: parent
            radius: Math.max(width, height) / 2
            color: MaterialTheme.transparent
            border.color: control.checked ? control.Material.accent : MaterialTheme.border
            border.width: control.checked ? 2 : 1
            Behavior on border.color { ColorAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        }
    }

}
