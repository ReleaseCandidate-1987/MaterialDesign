import QtQuick
import QtQuick.Controls.Material

TextField {
    id: control
    bottomPadding: 0
    implicitHeight: MaterialTheme.controlHeight + topInset
    implicitWidth: 120
    font: MaterialTheme.controlFont

    Material.foreground: MaterialTheme.foreground
    topInset: __lbl.visible ? __lbl.implicitHeight + spacing : 0
    topPadding: topInset
    selectionColor: MaterialTheme.accent

    property string title: ""
    property bool isValid: true
    property int spacing : 4

    MaterialLabel {
        id: __lbl
        visible: control.title.length > 0
        text: control.title
        font.pointSize: MaterialTheme.smallFont.pointSize
        font.capitalization: "AllUppercase"
    }

    background: Item {
        implicitWidth: 140
        implicitHeight: control.Material.textFieldHeight

        Rectangle {
            anchors.fill: parent
            radius: MaterialTheme.controlRadius
            color: MaterialTheme.backgroundAlt
            border.color: (enabled && control.hovered) ? MaterialTheme.foregroundMuted : MaterialTheme.border
            Behavior on border.color { ColorAnimation { duration: 200 } }
        }

        Rectangle {
            anchors.fill: parent
            radius: MaterialTheme.controlRadius
            color: MaterialTheme.transparent
            border.color: MaterialTheme.accent
            opacity: (enabled && control.activeFocus) ? 1 : 0
            border.width: 2
            Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.InOutQuad } }
        }
    }

}
