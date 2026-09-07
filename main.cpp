#include <QCoreApplication>
#include <QDir>
#include <QDebug>
#include <QRegularExpression>

/*!
 * Vorlage für den Inhalt der Metainfo: controls.metainfo.
 * @param name
 * @param entryName
 * @param category
 * @param requiredImport
 * @return
 */
QString metaType( const QString &name, const QString &entryName, const QString &category, const QString & requiredImport) {
    return QString(R"(
    Type {
        name: "%1"

        Hints {
            visibleInLibrary: true
            canBeDroppedInFormEditor: true
            canBeDroppedInNavigator: true
        }

        ItemLibraryEntry {
            name: "%2"
            category: "%3"
            version: "1.0"
            requiredImport: "%4"
        }
    }
)").arg(name, entryName, category, requiredImport);
}

/*!
 * Ließt den Content einer File und gibt diesen zurück.
 *
 * @param absoluteFilePath
 * @return
 */
QString getContent( const QString &absoluteFilePath ) {
    QFile file(absoluteFilePath);
    if ( !file.open(QIODevice::ReadOnly | QIODevice::Text ) )
        return {};
    return file.readAll();
}

/*!
 * Gibt den qmldir String wieder.
 *
 * Bsp: **MaterialToolTip 1.0 MaterialToolTip.qml**
 *
 * @param baseName
 * @return
 */
QString toQmldirString( const QString &baseName ) {
    return baseName + " 1.0 " + baseName + ".qml\n";
}

/*!
 * Schreibt den übergebenen Content in die jeweilig Datei.
 * @param content
 * @param filePath
 */
void writeContent( const QString &content, const QString &filePath ) {
    QFile file(filePath);
    if ( !file.open(QIODevice::WriteOnly | QIODevice::Text ) )
        return;
    file.write(content.toUtf8());
}

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);

    // Singleton-Regex, um Singleton-QML-Files zu erkennen.
    static QRegularExpression singletonRegex(R"(\bpragma\s*Singleton\b)");

    // Root
    const auto appDir = QDir( QCoreApplication::applicationDirPath() + "/../");

    if ( !appDir.mkdir("designer") )
        qDebug() << "designer-Ordner für controls.metainfo bereits erstellt.";

    // Alle QML-Files herausfiltern.
    const auto entryInfo = appDir.entryInfoList( {"*.qml"}, QDir::Files );

    // qmldir-Content-String.
    QString qmldirString;

    // Metainfo
    QString metaInfo = "MetaInfo{\n";
    // Metainfo-Blacklist
    const QStringList blackList = {
        "MaterialIcons",
        "MaterialMenu",
        "MaterialMenuItem",
        "MaterialTheme",
        "MaterialToolTip"
    };

    for ( const auto &entry: entryInfo ) {
        const auto baseName = entry.baseName();

        // Files wie zB. main.qml herausnehmen.
        if ( baseName.front().isLower() )
            continue;

        const auto content = getContent(entry.absoluteFilePath());

        // Überprüfen, ob es sich um eine Singleton-Komponente handelt.
        if ( content.contains(singletonRegex) )
            qmldirString += "singleton ";

        qmldirString += toQmldirString(baseName);

        const QString name = "MaterialDesign.Controls." + entry.baseName();

        // Skippen wenn ein gelisteter Name aus der Blacklist matched.
        if ( blackList.contains( entry.baseName() ))
            continue;

        metaInfo += metaType(name, entry.baseName(), "MaterialDesign Controls", "MaterialDesign.Controls");
    }
    metaInfo += "\n}";

    // qmldir-Content-String in die qmldir-File schreiben.
    writeContent( qmldirString, appDir.filePath("qmldir") );

    // Metainfo schreiben.
    writeContent( metaInfo, appDir.filePath("designer/controls.metainfo") );

    return 0;
}

