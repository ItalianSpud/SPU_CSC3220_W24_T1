#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStandardPaths>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/LunchBoxd/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);
    QString filePath = QStandardPaths::writableLocation(QStandardPaths::StandardLocation::AppLocalDataLocation);
    qDebug() << filePath;
    engine.setOfflineStoragePath(QString(filePath + "/OfflineStorage"));
    qDebug() << engine.offlineStoragePath();

    return app.exec();
}