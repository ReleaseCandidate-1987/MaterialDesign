import QtQuick
import QtQuick.Layouts

/*!
    MaterialTitleLabel-Komponente

    Stellt eine Überschrift und einen darunterliegenden Text dar,
    deren Darstellung unabhängig voneinander angepasst werden kann.

    properties:
        - title: Legt den Text der Überschrift fest.
        - text: Legt den darunterliegenden Text fest.
        - titleFont: Legt die Schriftart der Überschrift fest.
        - titleColor: Legt die Farbe der Überschrift fest.
        - titleVisible: Legt fest, ob die Überschrift sichtbar ist.
        - titleOpacity: Legt die Deckkraft der Überschrift fest.
        - titleHorizontalAlignment: Legt die horizontale Ausrichtung der Überschrift fest.
        - font: Legt die Schriftart des Textes fest.
        - textColor: Legt die Farbe des Textes fest.
        - textVisible: Legt fest, ob der Text sichtbar ist.
        - textOpacity: Legt die Deckkraft des Textes fest.
        - textHorizontalAlignment: Legt die horizontale Ausrichtung des Textes fest.
*/
ColumnLayout {
    id: control

    spacing: 4

    property string title: "Title"
    property string text: "Text"

    property alias titleFont: __title.font
    property alias titleColor: __title.color
    property alias titleVisible: __title.visible
    property alias titleOpacity: __title.opacity
    property alias titleHorizontalAlignment: __title.horizontalAlignment

    property alias font: __text.font
    property alias textColor: __text.color
    property alias textVisible: __text.visible
    property alias textOpacity: __text.opacity
    property alias textHorizontalAlignment: __text.horizontalAlignment
    height: implicitHeight

    MaterialLabel {
        id: __title
        visible: control.title.trim().length > 0
        text: control.title
        font: MaterialTheme.mediumFontBold
        Layout.alignment: horizontalAlignment
        elide: "ElideRight"
        backgroundVisible: false
    }

    MaterialLabel {
        id: __text
        visible: control.text.trim().length > 0
        text: control.text
        wrapMode: "WordWrap"
        backgroundVisible: false
        Layout.alignment: horizontalAlignment
        Layout.fillWidth: true
        opacity: 0.75
    }
}




