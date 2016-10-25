#ifndef PROPS_H
#define PROPS_H
#include <QString>
#include <QObject>

class Props : public QObject {

    Q_OBJECT

    Q_PROPERTY(QString value1 READ value1)
    Q_PROPERTY(QString value2 READ value2)
    Q_PROPERTY(QString value3 READ value3)

public:
    explicit Props(QObject * parent = 0): QObject(parent) {
        m_value1 = "PropsValue1";
        m_value2 = "PropsValue2";
        m_value3 = "PropsValue3";
    }
    virtual ~Props() {}

    QString value1() const { return m_value1; }
    QString value2() const { return m_value2; }
    QString value3() const { return m_value3; }

private:
    QString m_value1;
    QString m_value2;
    QString m_value3;
};

#endif // PROPS_H
