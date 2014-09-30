import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Rectangle {
    id:confirm
    height: Screen.height
    width: Screen.width

    signal showScreen(string msg)

    Text {
        id:confirmtext
        text: qsTr("Are you sure you want to quit?")
        anchors.centerIn: parent
    }

    Button{
        text: qsTr("yes")
        width: Screen.width/4.5
        height: width/4
        x: Screen.width/4.5
        y: Screen.height/2+confirmtext.height
        onClicked:
            Qt.quit()
    }
    Button{
        text: qsTr("no")
        width: Screen.width/4.5
        height: width/4
        x: Screen.width/4.5*2.5
        y: Screen.height/2+confirmtext.height
        onClicked:
            confirm.showScreen("mainpage.qml")
    }
}
