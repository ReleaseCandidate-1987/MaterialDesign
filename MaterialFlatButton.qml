import QtQuick
import QtQuick.Controls.Material

/*!
    MaterialFlatButton-Komponente

    Erweitert den MaterialButton und zeigt dessen Hintergrund transparent.
*/
MaterialButton {
    id: control
    flat: true
    Material.background: MaterialTheme.transparent
}
