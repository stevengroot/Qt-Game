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
        id: quit
        source: "images/close.png"
        width : Screen.logicalPixelDensity*20
        height: width
        anchors{
            left: mainwindow.left
            top: mainwindow.top }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                p_settings.showScreen("p_main.qml")
            }
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            p_settings.showScreen("p_main.qml")
        }
    }

    Text {
        text: qsTr("settings")
        anchors.centerIn: parent
    }
}
