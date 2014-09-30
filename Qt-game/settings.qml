import QtQuick 2.2
import QtQuick.Window 2.1
import "images"

Rectangle {
    id:settingswindow
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
                settingswindow.showScreen("mainpage.qml")
            }
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            settingswindow.showScreen("mainpage.qml")
        }
    }

    Text {
        text: qsTr("settings")
        anchors.centerIn: parent
    }
}
