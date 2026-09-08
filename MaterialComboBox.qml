import QtQuick
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialComboBox-Komponente

    Stellt eine Auswahlliste im Material-Design mit hervorgehobener
    Auswahl und animiertem Pfeilindikator dar.
*/
ComboBox {
    id: control
    implicitHeight: MaterialTheme.controlHeight
    implicitWidth: 100
    font: MaterialTheme.controlFont

    Material.accent: MaterialTheme.accent
    Material.foreground: MaterialTheme.foreground

    delegate: MaterialMenuItem {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        Material.foreground: control.currentIndex === index
                             ? ListView.view.contentItem.Material.accent
                             : ListView.view.contentItem.Material.foreground

        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    background: Item {
        implicitWidth: 140
        implicitHeight: control.Material.textFieldHeight

        Rectangle {
            anchors.fill: parent
            radius: MaterialTheme.controlRadius
            color: MaterialTheme.backgroundAlt
            border.color: (enabled && control.hovered)
                          ? MaterialTheme.foregroundMuted
                          : MaterialTheme.border

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

    popup: MaterialMenu {
        y:  control.height + 2
        width: control.width
        height: Math.min(contentItem.implicitHeight + verticalPadding * 2, control.Window.height - topMargin - bottomMargin)
        transformOrigin: Item.Top

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        onAboutToShow: __cimg.rotation = 180
        onAboutToHide: __cimg.rotation = 0
    }

    indicator: ColorImage {
        id: __cimg
        Behavior on rotation {
            RotationAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }

        x: control.mirrored ? control.padding : control.width - width
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Material/images/drop-indicator.png"
    }
}



