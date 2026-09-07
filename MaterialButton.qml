import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

/*!
    MaterialButton-Komponente

    Erweitert den standardmäßigen Button um einen konfigurierbaren Rahmen,
    eigene Hervorhebungsfarben und einen integrierten ToolTip.

    properties:
        - borderVisible: Legt fest, ob der Rahmen angezeigt wird.
        - highlightBorderColor: Legt die Rahmenfarbe beim Überfahren mit der Maus fest.
        - highlightColor: Legt die Hervorhebungs- und Ripple-Farbe fest.
        - iconPadding: Legt den Abstand zwischen Icon und Buttonrand fest.
        - toolTipPosition: Legt die Position des ToolTips fest.
        - toolTipText: Legt den angezeigten Text des ToolTips fest.
*/
Button {
    id: control
    text: qsTr("MaterialButton")


    implicitHeight: display === AbstractButton.TextUnderIcon
                    ? MaterialTheme.controlHeight + topPadding + bottomPadding + spacing :
                      MaterialTheme.controlHeight

    implicitWidth: display === AbstractButton.IconOnly
                   ? implicitHeight
                   : contentItem.implicitWidth + leftPadding + spacing + rightPadding

    rightPadding: display === AbstractButton.TextUnderIcon
                  || display === AbstractButton.IconOnly
                  ? iconPadding
                  : hasIcon && !mirrored
                    ? iconPadding * 2 : iconPadding

    leftPadding: display === AbstractButton.TextUnderIcon
                 || display === AbstractButton.IconOnly
                 ? iconPadding
                 : hasIcon && mirrored
                   ? iconPadding * 2 : iconPadding

    bottomPadding: display === AbstractButton.TextUnderIcon
                   || display === AbstractButton.IconOnly
                   ? iconPadding : 0

    topPadding: display === AbstractButton.TextUnderIcon
                || display === AbstractButton.IconOnly
                ? iconPadding : 0

    bottomInset: 0; topInset: 0; rightInset: 0; leftInset: 0

    icon.width: 18
    icon.height: 18

    font: MaterialTheme.controlFont
    opacity: enabled ? 1 : 0.5

    Material.roundedScale: Material.SmallScale
    Material.background: MaterialTheme.backgroundAlt
    Material.foreground: MaterialTheme.foregroundHighlight
    Material.elevation: 0

    Behavior on opacity { NumberAnimation { duration: 200; easing.type: "InOutQuad" } }
    property bool borderVisible: true
    property color highlightBorderColor: MaterialTheme.foregroundMuted
    property color highlightColor: Material.rippleColor
    property int iconPadding: 8
    property alias toolTipPosition: materialToolTip.position
    property string toolTipText: ""

    MaterialToolTip { id: materialToolTip  }

    background: Rectangle {
        implicitWidth: 64
        implicitHeight: control.Material.buttonHeight

        radius: control.Material.roundedScale === Material.FullScale ? height / 2 : control.Material.roundedScale
        color: enabled && control.checked ? control.highlightColor : control.Material.buttonColor(control.Material.MaterialTheme, control.Material.background,
                                                                                                  control.Material.accent, control.enabled, control.flat, control.highlighted, control.checked)
        border.color: !control.borderVisible ? MaterialTheme.transparent : (enabled && control.checked)
                                               ? MaterialTheme.accent : (enabled && control.hovered)
                                                 ? control.highlightBorderColor : MaterialTheme.border
        Behavior on border.color { ColorAnimation { duration: 200 } }
        Behavior on color { ColorAnimation { duration: 200 } }
        layer.enabled: control.enabled && color.a > 0 && !control.flat
        layer.effect: RoundedElevationEffect {
            elevation: control.Material.elevation
            roundedScale: control.background.radius
        }

        Ripple {
            clip: true
            clipRadius: parent.radius
            width: parent.width
            height: parent.height
            pressed: control.pressed
            anchor: control
            active: enabled && (control.down || control.visualFocus || control.hovered)
            color: control.flat && control.highlighted ? control.Material.highlightedRippleColor : control.highlightColor
        }
    }
}
