import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialSpinBox-Komponente

    Erweitert die standardmäßige SpinBox um eine optionale Überschrift
    und ermöglicht die Wertänderung zusätzlich durch horizontales Ziehen.

    properties:
        - title: Legt den Text der Überschrift fest.
*/
SpinBox {
    id: control
    implicitHeight: MaterialTheme.controlHeight + topInset
    implicitWidth: 100
    font: MaterialTheme.controlFont
    wheelEnabled: true
    Material.foreground: MaterialTheme.foreground
    topInset: __lbl.visible ? __lbl.implicitHeight + spacing : 0
    topPadding: topInset
    from: 1
    property string title: ""
    bottomPadding: 0
    spacing: 4

    onValueModified: {
        if ( !activeFocus )
            forceActiveFocus()
    }

    MaterialLabel {
        id: __lbl
        visible: control.title.length > 0
        text: control.title
        font.pointSize: MaterialTheme.smallFont.pointSize
        font.capitalization: "AllUppercase"
    }

    up.indicator: Item {
        x: control.mirrored ? 0 : control.width - width
        y: control.topInset
        implicitWidth: height
        implicitHeight: height
        height: control.height - control.topInset
        width: height

        Ripple {
            clipRadius: 4
            x: control.spacing
            y: control.spacing
            width: parent.width - 2 * control.spacing
            height: parent.height - 2 * control.spacing
            pressed: control.up.pressed
            active: control.up.pressed || control.up.hovered || control.visualFocus
            color: control.Material.rippleColor
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: Math.min(parent.width / 3, parent.height / 3)
            height: 2
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: Math.min(parent.width / 3, parent.height / 3)
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
    }

    down.indicator: Item {
        x: control.mirrored ? control.width - width : 0
        y: control.topInset
        implicitWidth: height
        implicitHeight: height
        height: control.height - control.topInset
        width: height

        Ripple {
            clipRadius: 4
            x: control.spacing
            y: control.spacing
            width: parent.width - 2 * control.spacing
            height: parent.height - 2 * control.spacing
            pressed: control.down.pressed
            active: control.down.pressed || control.down.hovered || control.visualFocus
            color: control.Material.rippleColor

        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
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

    DragHandler {
        id: __dragHandler
        target: null
        parent: control.contentItem
        acceptedDevices: PointerDevice.Mouse
        acceptedButtons: Qt.LeftButton

        property real __lastX: 0

        onActiveChanged: {
            if (active)
                __lastX = 0
        }

        onTranslationChanged: {
            const difference = translation.x - __lastX
            const steps = Math.trunc(difference / 5)

            if (steps === 0)
                return

            control.value = Math.max(control.from, Math.min(control.to, control.value + steps * control.stepSize))
            __lastX += steps * 5
            control.valueModified()
        }
    }
}
