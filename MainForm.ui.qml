import QtQuick 2.5

Rectangle {

    width: 360
    height: 360
    property alias mouseArea: mouseArea
    property alias value1Text: value1.text
    property alias value2Text: value2.text
    property alias value3Text: value3.text

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        Text {
            id: text1
            x: 40
            y: 39
            width: 203
            height: 19
            text: qsTr("Singleton values")
            font.bold: true
            font.pixelSize: 12
        }

        Text {
            id: value1
            x: 65
            y: 71
            width: 137
            height: 15
            property string property0: "none.none"
            font.pixelSize: 12
        }

        Text {
            id: value2
            x: 65
            y: 92
            width: 137
            height: 15
            font.pixelSize: 12
        }

        Text {
            id: value3
            x: 65
            y: 113
            width: 137
            height: 15
            font.pixelSize: 12
        }
    }
}
