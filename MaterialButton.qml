import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

Button {
    id: control
    text: qsTr("MaterialButton")

    implicitHeight: display === AbstractButton.TextUnderIcon
                    ? MaterialTheme.controlHeight + topPadding + bottomPadding + spacing :
                      MaterialTheme.controlHeight

    implicitWidth: display === AbstractButton.IconOnly
                   ? implicitHeight
                   : hasText ? contentItem.implicitWidth + leftPadding + spacing + rightPadding : height

    bottomInset: 0; topInset: 0; rightInset: 0; leftInset: 0

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

    icon.width: 18
    icon.height: 18
    Material.roundedScale: Material.SmallScale
    Material.background: MaterialTheme.backgroundAlt
    Material.foreground: MaterialTheme.foregroundHighlight
    font: MaterialTheme.controlFont
    Material.elevation: 0
    opacity: enabled ? 1 : 0.5

    Behavior on opacity { NumberAnimation { duration: 200; easing.type: "InOutQuad" } }
    property string toolTipText: ""
    property bool hasText: text.trim().length > 0
    property bool borderVisible: true
    property bool __hasIcon: hasIcon || hasIcon && (display === AbstractButton.TextUnderIcon || display === AbstractButton.TextUnderIcon)
    property color highlightBorderColor: MaterialTheme.foregroundMuted
    property color highlightColor: Material.rippleColor
    property int iconPadding: 8
    property alias toolTipPosition: materialToolTip.position

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
