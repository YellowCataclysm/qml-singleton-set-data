import QtQuick 2.5
import QtQuick.Window 2.2
import "."
import test.props 0.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MainForm {
        id: mainForm
        anchors.fill: parent
        mouseArea.onClicked: {
            mainForm.value1Text = TestSingleton.value1
            mainForm.value2Text = TestSingleton.value2
            mainForm.value3Text = TestSingleton.value3
        }
    }

    // Set properties by executing passed js-code
    function setPropertiesWithRawJS(code) {
        eval(code)
        console.log( "setPropertiesWithRawJS() call" )
        console.log( "Singleton values: ", TestSingleton.value1, TestSingleton.value2, TestSingleton.value3 )
    }

    // Set properties from custom-class context value
    function setPropertiesFromContext() {
        TestSingleton.value1 = props.value1
        TestSingleton.value2 = props.value2
        TestSingleton.value3 = props.value3
        console.log( "setPropertiesFromContext() call" )
        console.log( "Singleton values: ", TestSingleton.value1, TestSingleton.value2, TestSingleton.value3 )
    }

    // Set properties from custom-class passed as argument
    function setPropertiesObject(dataObject) {
        TestSingleton.value1 = dataObject["value1"]
        TestSingleton.value2 = dataObject["value2"]
        TestSingleton.value3 = dataObject["value3"]
        console.log( "setPropertiesObject() call" )
        console.log( "Singleton values: ", TestSingleton.value1, TestSingleton.value2, TestSingleton.value3 )
    }

    // Set properties with QVariantMap passed as argument
    // Field names hardcoded
    function setPropertiesMap(dataObject) {
        TestSingleton["value1"] = dataObject["value1"]
        TestSingleton["value2"] = dataObject["value2"]
        TestSingleton["value3"] = dataObject["value3"]
        console.log( "setPropertiesMap() call" )
        console.log( "Singleton values: ", TestSingleton.value1, TestSingleton.value2, TestSingleton.value3 )
    }

    // Set properties with QVariantMap passed as argument
    // Assigning in one-to-one name accordance
    function setPropertiesMapBlind(dataObject) {
        for(var name in dataObject) {
            if( dataObject.hasOwnProperty(name) ) {
                TestSingleton[name] = dataObject[name]
            }
        }
        console.log( "setPropertiesMapBlind() call" )
        console.log( "Singleton values: ", TestSingleton.value1, TestSingleton.value2, TestSingleton.value3 )
    }
}
