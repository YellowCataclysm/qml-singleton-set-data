#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>
#include "props.h"

QVariantMap getMappedPropertues() {
    QVariantMap map;
    map.insert("value1","MapValue1");
    map.insert("value2","MapValue2");
    map.insert("value3","MapValue3");
    return map;
}

void setMapped( QObject * root ) {
    QMetaObject::invokeMethod(root,"setPropertiesMap", Q_ARG(QVariant, QVariant::fromValue(getMappedPropertues())));
}

void setMappedBlind( QObject * root ) {
    QMetaObject::invokeMethod(root,"setPropertiesMapBlind", Q_ARG(QVariant, QVariant::fromValue(getMappedPropertues())));
}

void setJSCode( QObject * root ) {
    QString js = R"code(
                 TestSingleton.value1 = "JSValue1"
                 TestSingleton.value2 = "JSValue3"
                 TestSingleton.value3 = "JSValue2")code";
}

void setCustomContainer(QObject * root) {
    auto prop = new Props();
    QMetaObject::invokeMethod(root,"setPropertiesObject", Q_ARG(QVariant, QVariant::fromValue(prop)));
    prop->deleteLater();
}

void setCustomContainerContext(QObject * root) {
    QMetaObject::invokeMethod(root,"setPropertiesFromContext");
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Props>("test.props", 0, 1, "Props");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    auto prop = new Props();
    engine.rootContext()->setContextProperty("props", prop);

    auto root = engine.rootObjects().first();
    setCustomContainer(root);

    int code = app.exec();
    delete prop;
    return code;
}
