pragma Singleton
import QtQuick
import QtQuick.Controls.Material

QtObject {
    id: qtObject
    property string title: "MaterialDesign"
    property int width: 1920
    property int height: 1080

    property int globalRadius: Material.SmallScale
    property int backgroundElevation: 12
    property int controlRadius: 8
    property int controlHeight: 32

    property bool isDarkMode: true

    // ColorPalette
    property color background: isDarkMode ? "#1e2227" : "#fafafa"
    property color backgroundAlt: isDarkMode ? "#282c34" : "#f0f0f0"
    property color backgroundElevated: isDarkMode ? "#2c313a" : "#ffffff"

    property color foreground: isDarkMode ? "#abb2bf" : "#383a42"
    property color foregroundMuted: isDarkMode ? "#7f848e" : "#696c77"
    property color foregroundDisabled: isDarkMode ? "#5c6370" : "#a0a1a7"

    property color border: isDarkMode ? "#3e4451" : "#d7dae0"
    property color borderFocused: isDarkMode ? "#61afef" : "#4078f2"

    property color selection: isDarkMode ? "#3e4451" : "#e5e5e6"
    property color hover: isDarkMode ? "#2c313a" : "#eaeaeb"
    property color pressed: isDarkMode ? "#353b45" : "#dfe1e5"
    property color disabled: isDarkMode ? "#4b5263" : "#a0a1a7"

    property color red: isDarkMode ? "#e06c75" : "#e45649"
    property color orange: isDarkMode ? "#d19a66" : "#986801"
    property color yellow: isDarkMode ? "#e5c07b" : "#c18401"
    property color green: isDarkMode ? "#98c379" : "#50a14f"
    property color cyan: isDarkMode ? "#56b6c2" : "#0184bc"
    property color blue: isDarkMode ? "#61afef" : "#4078f2"
    property color purple: isDarkMode ? "#c678dd" : "#a626a4"

    property color accent: blue

    property color success: green
    property color warning: yellow
    property color error: red
    property color information: blue

    property color link: blue
    property color placeholder: foregroundMuted

    property color transparent: "transparent"

    property color shadow: isDarkMode ? "#80000000" : "#30000000"
    property color overlay: isDarkMode ? "#99000000" : "#66000000"

    function rgba( clr, alpha = 1.0 ) {
        return Qt.rgba( clr.r, clr.g, clr.b, alpha );
    }

    // Fonts
    property string family: "Roboto"

    property real fontFactor: 1

    property QtObject fontSize: QtObject {
        property int small: 8 * fontFactor
        property int control: 10 * fontFactor
        property int medium: 12 * fontFactor
        property int header: 16 * fontFactor
        property int title: 18 * fontFactor
        property int large: 24 * fontFactor
        property int huge: 32 * fontFactor
    }

    property font smallFont: Qt.font( { family: family, pointSize: fontSize.small } )
    property font controlFont: Qt.font( { family: family, pointSize: fontSize.control } )
    property font mediumFont: Qt.font( { family: family, pointSize: fontSize.medium } )
    property font headerFont: Qt.font( { family: family, pointSize: fontSize.header } )
    property font titleFont: Qt.font( { family: family, pointSize: fontSize.title } )
    property font largeFont: Qt.font( { family: family, pointSize: fontSize.large } )
    property font hugeFont: Qt.font( { family: family, pointSize: fontSize.huge } )

    property font smallFontBold: Qt.font( { family: family, pointSize: fontSize.small, bold: true } )
    property font controlFontBold: Qt.font( { family: family, pointSize: fontSize.control, bold: true } )
    property font mediumFontBold: Qt.font( { family: family, pointSize: fontSize.medium, bold: true } )
    property font headerFontBold: Qt.font( { family: family, pointSize: fontSize.header, bold: true } )
    property font titleFontBold: Qt.font( { family: family, pointSize: fontSize.title, bold: true } )
    property font largeFontBold: Qt.font( { family: family, pointSize: fontSize.large, bold: true } )
    property font hugeFontBold: Qt.font( { family: family, pointSize: fontSize.huge, bold: true } )

}
