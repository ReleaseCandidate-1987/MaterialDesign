import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialAlert-Komponente

    Stellt einen hervorgehobenen Hinweis mit farbigem Seitenindikator sowie Titel- und Beschreibungstext dar.

    properties:
        - spacing: Legt den Abstand zwischen Titel und Beschreibungstext fest.
        - padding: Legt den allgemeinen Innenabstand fest.
        - topPadding: Legt den oberen Innenabstand fest.
        - leftPadding: Legt den linken Innenabstand fest.
        - rightPadding: Legt den rechten Innenabstand fest.
        - bottomPadding: Legt den unteren Innenabstand fest.
        - color: Legt die Farbe des Seitenindikators und des Titels fest.
        - backgroundColor: Legt die Hintergrundfarbe fest.
        - backgroundOpacity: Legt die Deckkraft des Hintergrundes fest.
        - radius: Legt die Rundung der Hintergrundecken fest.
        - titleFont: Legt die Schriftart des Titels fest.
        - titleVisible: Legt fest, ob der Titel angezeigt wird.
        - titleOpacity: Legt die Deckkraft des Titels fest.
        - titleHorizontalAlignment: Legt die horizontale Ausrichtung des Titels fest.
        - font: Legt die Schriftart des Beschreibungstextes fest.
        - textVisible: Legt fest, ob der Beschreibungstext angezeigt wird.
        - textOpacity: Legt die Deckkraft des Beschreibungstextes fest.
        - textHorizontalAlignment: Legt die horizontale Ausrichtung des Beschreibungstextes fest.
*/
Item {
    id: control
    x: 494
    y: 608
    width: 400
    height: __lbl.implicitHeight + topPadding + bottomPadding

    Material.elevation: 8
    Material.foreground: MaterialTheme.foreground
    Material.background: MaterialTheme.backgroundAlt
    Material.accent: MaterialTheme.accent

    property int spacing: 4
    property int padding: 16
    property int topPadding: 16
    property int leftPadding: 16 + __indicator.width
    property int rightPadding: 16
    property int bottomPadding: 16

    property real backgroundOpacity: 1
    property int radius: MaterialTheme.controlRadius


    property alias title: __lbl.title
    property alias titleFont: __lbl.titleFont
    property alias titleVisible: __lbl.titleVisible
    property alias titleOpacity: __lbl.titleOpacity
    property alias titleHorizontalAlignment: __lbl.titleHorizontalAlignment

    property alias text:  __lbl.text
    property alias font: __lbl.font
    property alias textVisible: __lbl.textVisible
    property alias textOpacity: __lbl.textOpacity
    property alias textHorizontalAlignment: __lbl.textHorizontalAlignment

    Rectangle {
        id: __bg
        anchors{
            fill: parent
            leftMargin: control.radius / 4
        }
        radius: control.radius
        color: MaterialTheme.rgba(control.Material.backgroundColor, control.backgroundOpacity)
        layer.enabled: control.enabled && color.a > 0 && control.Material.elevation > 0
        layer.effect: RoundedElevationEffect {
            elevation: control.Material.elevation
        }
    }

    Rectangle {
        id: __indicator
        anchors{
            left: parent.left; top: parent.top; bottom: parent.bottom
            topMargin: control.radius / 2
            bottomMargin: control.radius / 2
        }

        width: 4
        radius: 2
        color: control.Material.accent

    }

    MaterialTitleLabel {
        id: __lbl
        titleColor: control.Material.accent
        textColor: control.Material.foreground
        anchors {
            fill: parent
            leftMargin: control.leftPadding; rightMargin: control.rightPadding
            topMargin: control.topPadding; bottomMargin: control.bottomPadding
        }

        spacing: control.spacing
    }
}

























