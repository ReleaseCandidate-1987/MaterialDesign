import QtQuick
import QtQuick.Controls.Material

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
    implicitHeight: 42
    LayoutMirroring.enabled: true
    font: MaterialTheme.controlFont
    Material.foreground: MaterialTheme.red
    Material.primary: MaterialTheme.red

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
}
