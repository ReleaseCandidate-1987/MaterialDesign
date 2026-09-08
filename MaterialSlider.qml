import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

/*!
    MaterialSlider-Komponente

    Erweitert den Slider um eine Überschrift und eine optionale Anzeige des aktuellen Wertes.

    properties:
        - title: Legt die Überschrift des Sliders fest.
        - titleValue: Stellt einen zusätzlichen ganzzahligen Wert für den Titelbereich bereit.
        - titleValueVisible: Legt fest, ob der aktuelle Slider-Wert angezeigt wird.
*/
Slider {
    id: control
    implicitHeight: 12 + topInset;
    handle.height: 6; handle.width: 6
    implicitWidth: 100
    wheelEnabled: true
    font: Fonts.controlFont
    Material.foreground: ColorPalette.foreground
    topInset: __lbl.visible ? __lbl.implicitHeight + spacing : 0
    topPadding: topInset
    spacing: 8

    property string title: "Slider"
    property int titleValue: 0
    property bool titleValueVisible: true

    RowLayout {
        width: control.width
        MaterialLabel {
            id: __lbl
            visible: control.title.length > 0
            text: control.title
            font.pointSize: Fonts.controlFont.pointSize
            font.capitalization: "AllUppercase"
            Layout.fillWidth: true
            elide: "ElideRight"
        }

        MaterialLabel {
            visible: control.title.length > 0 && titleValueVisible
            text: `${parseFloat(control.value.toFixed(2))}`
            font.pointSize: Fonts.smallFont.pointSize
            font.capitalization: "AllUppercase"

        }
    }
}
