import QtQuick 2.2
import QtQuick.Window 2.1
import "images"

Rectangle {
    id:p_settings
    width: Screen.width
    height: Screen.height
    color:"lightsteelblue"

    signal showScreen(string msg)

    Image {
        id: quit                                    //Quit button
        source: "images/close.png"
        width : Screen.logicalPixelDensity*15
        height: width
        anchors{
            left: p_settings.left
            top: p_settings.top }
        MouseArea {
            anchors.fill: parent
            onClicked: {                            //if quit button is pressed, go back to main
                p_settings.showScreen("p_main.qml")
            }
        }
    }

    Keys.onReleased: {                              //if backbutton is pressed, go back to main
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            p_settings.showScreen("p_main.qml")
        }
    }

    Text {                                          //simple settings text
        text: qsTr("settings")
        anchors.centerIn: parent
    }
}
