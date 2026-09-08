import QtQuick
import QtQuick.Controls.Material

/*!
    MaterialLinkLabel-Komponente

    Stellt einen anklickbaren Link dar, der im Standardbrowser geöffnet wird.

    properties:
        - link: Legt die anzuzeigende und zu öffnende Internetadresse fest.
*/
Label {
    property string link: "https://github.com/ReleaseCandidate-1987/MaterialDesign/blob/main/README.md"

    textFormat: Text.RichText
    text: "<a href=\"" + (link.startsWith("http") ? link : "https://" + link) + "\">" + link + "</a>"

    wrapMode: Text.WordWrap
    font: MaterialTheme.controlFont

    onLinkActivated: function(link) {
        Qt.openUrlExternally(link)
    }

    HoverHandler { cursorShape: Qt.PointingHandCursor }
}
