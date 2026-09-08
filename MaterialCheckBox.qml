import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialCheckBox-Komponente

    Erweitert die standardmäßige CheckBox um eine zusätzliche Überschrift
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
CheckBox {
    id: control
    text: "Text"
    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 0
    spacing: 16
    implicitHeight: MaterialTheme.controlHeight
    LayoutMirroring.enabled: true
    font: MaterialTheme.controlFont
    Material.foreground: MaterialTheme.foreground
    Material.background: MaterialTheme.background
    Material.accent: MaterialTheme.accent

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
            anchors.fill: parent
            radius: MaterialTheme.controlRadius
            color: control.Material.accent
            scale: control.checked ? 1 : 0
            opacity: control.checked ? 1 : 0
            Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
            Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        }

        Image {
            width: parent.width * 0.6
            height: parent.height * 0.6
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Material/images/check.png"
            scale: control.checked ? 1 : 0.8
            opacity: control.checked ? 1 : 0
            Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
            Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        }

        Rectangle {
            anchors.fill: parent
            radius: MaterialTheme.controlRadius
            color: MaterialTheme.transparent
            border.color: control.checked ? MaterialTheme.foreground : MaterialTheme.border
        }
    }
}
