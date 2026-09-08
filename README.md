# MaterialDesign

MaterialDesign ist eine Sammlung selbst entwickelter QML-Komponenten auf Basis von Qt Quick Controls und dem Material-Stil. Die Komponenten besitzen ein einheitliches Erscheinungsbild und können wie gewöhnliche QML-Komponenten verwendet werden.

## Konzept

Die Komponenten sind bewusst nicht als vollständiger eigener Qt-Quick-Controls-Stil umgesetzt. Ein solcher Stil würde Templates für sämtliche Controls benötigen und auch Komponenten ersetzen, die für dieses Design nicht angepasst werden müssen.

Stattdessen enthält das Modul nur ausgewählte Komponenten, die tatsächlich ein eigenes Erscheinungsbild oder zusätzliche Eigenschaften benötigen. Standardkomponenten wie `Window` können dadurch weiterhin unverändert verwendet werden.

Die Namen der angepassten Komponenten beginnen mit `Material`, beispielsweise `MaterialButton`, `MaterialLabel` oder `MaterialCheckBox`. Dadurch bleibt im QML-Code direkt erkennbar, ob eine Standardkomponente oder eine angepasste Komponente verwendet wird.

## Modul einbinden

Der Ordner `MaterialDesign` muss eine `qmldir`-Datei enthalten, in der das Modul eingetragen ist:

```text
module MaterialDesign
```

Die Verzeichnisstruktur kann beispielsweise so aussehen:

```text
D:/Pfad/zu/QML-Modulen/
└── MaterialDesign/
    ├── qmldir
    ├── MaterialButton.qml
    ├── MaterialLabel.qml
    └── ...
```

> [!IMPORTANT]
> Als Importpfad wird immer der übergeordnete Ordner von `MaterialDesign` angegeben. In diesem Beispiel ist das `D:/Pfad/zu/QML-Modulen`.

Anschließend kann das Modul in einer QML-Datei importiert werden:

```qml
import MaterialDesign

MaterialButton {
    text: "Speichern"
}
```

### Qt Design Studio

In einem Qt-Design-Studio-Projekt wird der übergeordnete Modulordner über `importPaths` eingebunden. Der Eintrag wird innerhalb des vorhandenen `Project`-Blocks der `.qmlproject`-Datei ergänzt:

```qml
importPaths: [
    ".",
    "D:/Pfad/zu/QML-Modulen"
]
```

Dadurch kann Qt Design Studio die Komponenten des Moduls finden und in der Design- sowie Codeansicht verwenden.

### qmake

Bei einem qmake-Projekt wird der Importpfad in der `.pro`-Datei eingetragen:

```qmake
QML_IMPORT_PATH += D:/Pfad/zu/QML-Modulen
```

Dieser Eintrag stellt den Importpfad den QML-Werkzeugen von Qt Creator zur Verfügung.

### CMake

Bei einem CMake-Projekt wird der Importpfad in der `CMakeLists.txt` hinterlegt:

```cmake
set(QML_IMPORT_PATH
    "D:/Pfad/zu/QML-Modulen"
    CACHE STRING "Zusätzliche QML-Importpfade"
    FORCE
)
```

Dadurch können die QML-Werkzeuge das externe Modul während der Entwicklung auflösen.

### main.cpp

Damit das Modul auch zur Laufzeit gefunden wird, muss der übergeordnete Modulordner dem `QQmlApplicationEngine` hinzugefügt werden. Der Importpfad wird vor dem Laden der ersten QML-Datei gesetzt:

```cpp
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("D:/Pfad/zu/QML-Modulen"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return QGuiApplication::exec();
}
```

Der Platzhalter `D:/Pfad/zu/QML-Modulen` muss in allen Beispielen durch den tatsächlichen Speicherort des übergeordneten Modulordners ersetzt werden.

## Komponenten

Die folgenden Komponenten erweitern ausgewählte Qt Quick Controls um ein einheitliches Material-Design und zusätzliche Eigenschaften. Sie sind alphabetisch nach ihrem Komponentennamen sortiert.

### MaterialAlert

Stellt einen hervorgehobenen Hinweis mit farbigem Seitenindikator sowie Titel- und Beschreibungstext dar.

<img width="421" height="156" alt="grafik" src="https://github.com/user-attachments/assets/77fb76cd-68e0-4c6d-b12e-d8fe7fe4fb07" />
<img width="429" height="161" alt="grafik" src="https://github.com/user-attachments/assets/103e7f68-4bb6-458e-bf1e-fdd44effcabe" />


| Property | Typ | Beschreibung |
|---|---|---|
| `spacing` | `int` | Legt den Abstand zwischen Titel und Beschreibungstext fest. |
| `padding` | `int` | Legt den allgemeinen Innenabstand fest. |
| `topPadding` | `int` | Legt den oberen Innenabstand fest. |
| `leftPadding` | `int` | Legt den linken Innenabstand fest. |
| `rightPadding` | `int` | Legt den rechten Innenabstand fest. |
| `bottomPadding` | `int` | Legt den unteren Innenabstand fest. |
| `color` | `color` | Legt die Farbe des Seitenindikators und des Titels fest. |
| `backgroundColor` | `color` | Legt die Hintergrundfarbe fest. |
| `backgroundOpacity` | `real` | Legt die Deckkraft des Hintergrundes fest. |
| `backgroundRadius` | `int` | Legt die Rundung der Hintergrundecken fest. |
| `titleFont` | `font` | Legt die Schriftart des Titels fest. |
| `titleColor` | `color` | Legt die Farbe des Titels fest. |
| `titleVisible` | `bool` | Legt fest, ob der Titel angezeigt wird. |
| `titleOpacity` | `real` | Legt die Deckkraft des Titels fest. |
| `titleHorizontalAlignment` | `int` | Legt die horizontale Ausrichtung des Titels fest. |
| `font` | `font` | Legt die Schriftart des Beschreibungstextes fest. |
| `textColor` | `color` | Legt die Farbe des Beschreibungstextes fest. |
| `textVisible` | `bool` | Legt fest, ob der Beschreibungstext angezeigt wird. |
| `textOpacity` | `real` | Legt die Deckkraft des Beschreibungstextes fest. |
| `textHorizontalAlignment` | `int` | Legt die horizontale Ausrichtung des Beschreibungstextes fest. |

### MaterialButton

Erweitert den standardmäßigen Button um einen konfigurierbaren Rahmen, eigene Hervorhebungsfarben und einen integrierten ToolTip.

<img width="182" height="101" alt="grafik" src="https://github.com/user-attachments/assets/8654e64a-5c13-43a4-976f-2d5a326afebf" />

| Property | Typ | Beschreibung |
|---|---|---|
| `borderVisible` | `bool` | Legt fest, ob der Rahmen angezeigt wird. |
| `highlightBorderColor` | `color` | Legt die Rahmenfarbe beim Überfahren mit der Maus fest. |
| `highlightColor` | `color` | Legt die Hervorhebungs- und Ripple-Farbe fest. |
| `iconPadding` | `int` | Legt den Abstand zwischen Icon und Buttonrand fest. |
| `toolTipPosition` | `int` | Legt die Position des ToolTips fest. |
| `toolTipText` | `string` | Legt den angezeigten Text des ToolTips fest. |

### MaterialCheckBox

Kombiniert eine CheckBox mit einem getrennt konfigurierbaren Titel- und Beschreibungstext.

| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt den Titel der CheckBox fest. |
| `titleFont` | `font` | Legt die Schriftart des Titels fest. |
| `titleColor` | `color` | Legt die Textfarbe des Titels fest. |
| `titleVisible` | `bool` | Legt fest, ob der Titel angezeigt wird. |
| `titleOpacity` | `real` | Legt die Deckkraft des Titels fest. |
| `textColor` | `color` | Legt die Farbe des Beschreibungstextes fest. |
| `textVisible` | `bool` | Legt fest, ob der Beschreibungstext angezeigt wird. |
| `textOpacity` | `real` | Legt die Deckkraft des Beschreibungstextes fest. |

### MaterialColorImage

Stellt ein farblich anpassbares Bild mit optionalen Schatten-, Helligkeits- und Weichzeichnungseffekten dar.

<img width="287" height="332" alt="grafik" src="https://github.com/user-attachments/assets/a752164c-f858-4a39-853f-7b3d0a26061d" />

| Property | Typ | Beschreibung |
|---|---|---|
| `source` | `url` | Legt die Bildquelle fest. |
| `color` | `color` | Legt die Farbe des Bildes fest. |
| `cache` | `bool` | Legt fest, ob das Bild zwischengespeichert wird. |
| `asynchronous` | `bool` | Legt fest, ob das Bild asynchron geladen wird. |
| `padding` | `int` | Legt den inneren Abstand zum Rand fest. |
| `mirror` | `bool` | Legt fest, ob das Bild gespiegelt wird. |
| `mipmap` | `bool` | Legt fest, ob Mipmaps für das Bild verwendet werden. |
| `blur` | `real` | Legt die Stärke der Weichzeichnung fest. |
| `brightness` | `real` | Legt die Helligkeit des Bildes fest. |
| `shadowEnabled` | `bool` | Legt fest, ob ein Schatten angezeigt wird. |
| `shadowBlur` | `real` | Legt die Weichzeichnung des Schattens fest. |
| `shadowColor` | `color` | Legt die Farbe des Schattens fest. |
| `shadowScale` | `real` | Legt die Skalierung des Schattens fest. |
| `shadowOpacity` | `real` | Legt die Deckkraft des Schattens fest. |
| `shadowHorizontalOffset` | `real` | Legt die horizontale Verschiebung des Schattens fest. |
| `shadowVerticalOffset` | `real` | Legt die vertikale Verschiebung des Schattens fest. |

### MaterialComboBox

Stellt eine ComboBox mit einem an das eigene Material-Design angepassten Auswahlmenü dar.

Die Komponente besitzt keine zusätzlichen Properties.

### MaterialFrame

Stellt einen Material-Rahmen mit anpassbarer Rundung und Hintergrunddeckkraft dar.

| Property | Typ | Beschreibung |
|---|---|---|
| `radius` | `int` | Legt die Rundung der Ecken fest. |
| `backgroundOpacity` | `real` | Legt die Deckkraft des Hintergrundes fest. |

### MaterialGroupBox

Stellt einen beschrifteten Container zum übersichtlichen Gruppieren zusammengehöriger Inhalte dar.

<img width="291" height="184" alt="grafik" src="https://github.com/user-attachments/assets/cfbfa590-13af-4c26-bd2e-4a8ab25706da" />


| Property | Typ | Beschreibung |
|---|---|---|
| `borderVisible` | `bool` | Legt fest, ob der Rahmen angezeigt wird. |
| `radius` | `int` | Legt die Rundung der Containerecken fest. |

### MaterialIconLabel

Kombiniert ein Icon mit einem Text und ermöglicht die Verwendung eines eigenen Hintergrundelementes.

| Property | Typ | Beschreibung |
|---|---|---|
| `background` | `Item` | Legt das Hintergrundelement der Komponente fest. |

### MaterialLabel

Erweitert das standardmäßige Label um einen optionalen Hintergrund und einen konfigurierbaren Rahmen.

| Property | Typ | Beschreibung |
|---|---|---|
| `backgroundVisible` | `bool` | Legt fest, ob der Hintergrund angezeigt wird. |
| `backgroundColor` | `color` | Legt die Farbe des Hintergrundes fest. |
| `backgroundRadius` | `int` | Legt die Rundung der Hintergrundecken fest. |
| `backgroundOpacity` | `real` | Legt die Deckkraft des Hintergrundes fest. |
| `borderColor` | `color` | Legt die Farbe des Rahmens fest. |
| `borderWidth` | `int` | Legt die Breite des Rahmens fest. |

### MaterialLinkLabel

Stellt einen anklickbaren Link dar, der im Standardbrowser geöffnet wird.

<img width="502" height="32" alt="grafik" src="https://github.com/user-attachments/assets/f636cc47-576e-4482-84f3-e7b01a6633ca" />

| Property | Typ | Beschreibung |
|---|---|---|
| `link` | `string` | Legt die anzuzeigende und zu öffnende Internetadresse fest. |

### MaterialMenu

Stellt ein Menü mit einem abgerundeten Material-Hintergrund und einheitlich gestalteten Menüeinträgen dar.

| Property | Typ | Beschreibung |
|---|---|---|
| `radius` | `int` | Legt die Rundung der Menüecken fest. |

### MaterialMenuItem

Stellt einen an das eigene Material-Design angepassten Eintrag für Menüs und Auswahlfelder dar.

Die Komponente besitzt keine zusätzlichen Properties.

### MaterialPopup

Stellt ein Popup mit abgedunkeltem Hintergrund und anpassbarer Eckenrundung dar.

#### Properties

| Property | Typ | Beschreibung |
|---|---|---|
| `radius` | `int` | Legt die Rundung der Popupecken fest. |

#### Signale

| Signal | Beschreibung |
|---|---|
| `accepted` | Wird ausgelöst, wenn der Inhalt des Popups bestätigt wurde. |

### MaterialRadioButton

Kombiniert einen RadioButton mit einem getrennt konfigurierbaren Titel- und Beschreibungstext.

| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt den Titel des RadioButtons fest. |
| `titleFont` | `font` | Legt die Schriftart des Titels fest. |
| `titleColor` | `color` | Legt die Textfarbe des Titels fest. |
| `titleVisible` | `bool` | Legt fest, ob der Titel angezeigt wird. |
| `titleOpacity` | `real` | Legt die Deckkraft des Titels fest. |
| `textColor` | `color` | Legt die Farbe des Beschreibungstextes fest. |
| `textVisible` | `bool` | Legt fest, ob der Beschreibungstext angezeigt wird. |
| `textOpacity` | `real` | Legt die Deckkraft des Beschreibungstextes fest. |

### MaterialRoundedImage

Stellt ein Bild mit abgerundeten Ecken und einem konfigurierbaren Rahmen dar.

<img width="262" height="261" alt="grafik" src="https://github.com/user-attachments/assets/a73e44ec-40f9-4e6e-8b7e-bc300b9ccdac" />

| Property | Typ | Beschreibung |
|---|---|---|
| `radius` | `int` | Legt die Rundung der Bildecken fest. |
| `borderColor` | `color` | Legt die Farbe des Rahmens fest. |
| `borderWidth` | `int` | Legt die Breite des Rahmens fest. |
| `padding` | `int` | Legt den Abstand zwischen Bild und Komponentenrand fest. |
| `source` | `url` | Legt die Bildquelle fest. |
| `cache` | `bool` | Legt fest, ob das Bild zwischengespeichert wird. |
| `asynchronous` | `bool` | Legt fest, ob das Bild asynchron geladen wird. |
| `fillMode` | `int` | Legt fest, wie das Bild innerhalb der verfügbaren Fläche dargestellt wird. |

### MaterialSlider

Erweitert den standardmäßigen Slider um eine Überschrift und eine optionale Anzeige des aktuellen Wertes.

| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt die Überschrift des Sliders fest. |
| `titleValue` | `int` | Stellt einen zusätzlichen ganzzahligen Wert für den Titelbereich bereit. |
| `titleValueVisible` | `bool` | Legt fest, ob der aktuelle Slider-Wert angezeigt wird. |

### MaterialSpinBox

Stellt eine numerische Eingabe im eigenen Material-Design mit einer optionalen Überschrift dar.

<img width="114" height="49" alt="grafik" src="https://github.com/user-attachments/assets/865bb31f-3b4a-4819-a18c-f651fc9c6420" />


| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt die oberhalb der SpinBox angezeigte Überschrift fest. |

### MaterialSwitch

Kombiniert einen Switch mit einem getrennt konfigurierbaren Titel- und Beschreibungstext.

| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt den Titel des Switches fest. |
| `titleFont` | `font` | Legt die Schriftart des Titels fest. |
| `titleColor` | `color` | Legt die Textfarbe des Titels fest. |
| `titleVisible` | `bool` | Legt fest, ob der Titel angezeigt wird. |
| `titleOpacity` | `real` | Legt die Deckkraft des Titels fest. |
| `textColor` | `color` | Legt die Farbe des Beschreibungstextes fest. |
| `textVisible` | `bool` | Legt fest, ob der Beschreibungstext angezeigt wird. |
| `textOpacity` | `real` | Legt die Deckkraft des Beschreibungstextes fest. |

### MaterialTitleLabel

Stellt einen Titel und einen darunterliegenden Beschreibungstext als gemeinsame Komponente dar.

| Property | Typ | Beschreibung |
|---|---|---|
| `title` | `string` | Legt den Titel fest. |
| `text` | `string` | Legt den Beschreibungstext fest. |
| `titleFont` | `font` | Legt die Schriftart des Titels fest. |
| `titleColor` | `color` | Legt die Farbe des Titels fest. |
| `titleVisible` | `bool` | Legt fest, ob der Titel angezeigt wird. |
| `titleOpacity` | `real` | Legt die Deckkraft des Titels fest. |
| `titleHorizontalAlignment` | `int` | Legt die horizontale Ausrichtung des Titels fest. |
| `font` | `font` | Legt die Schriftart des Beschreibungstextes fest. |
| `textColor` | `color` | Legt die Farbe des Beschreibungstextes fest. |
| `textVisible` | `bool` | Legt fest, ob der Beschreibungstext angezeigt wird. |
| `textOpacity` | `real` | Legt die Deckkraft des Beschreibungstextes fest. |
| `textHorizontalAlignment` | `int` | Legt die horizontale Ausrichtung des Beschreibungstextes fest. |

### MaterialToolTip

Stellt einen ToolTip bereit, der an einer festgelegten Seite der zugehörigen Komponente angezeigt wird.

| Property | Typ | Beschreibung |
|---|---|---|
| `position` | `int` | Legt mit `PositionLeft`, `PositionRight`, `PositionTop` oder `PositionBottom` die Position des ToolTips fest. |

### MaterialTransparentBackground

Stellt einen karierten Hintergrund zur Kennzeichnung transparenter Flächen dar.

<img width="320" height="324" alt="grafik" src="https://github.com/user-attachments/assets/5e8ed4a4-1b3b-416e-b13c-5e002043cc02" />


| Property | Typ | Beschreibung |
|---|---|---|
| `radius` | `int` | Legt die Rundung der Hintergrundecken fest. |
| `tileSize` | `int` | Legt die Größe der einzelnen Kacheln fest. |




















