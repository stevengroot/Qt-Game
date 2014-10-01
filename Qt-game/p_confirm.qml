import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Rectangle {
    id:p_confirm
    height: Screen.height
    width: Screen.width

    signal showScreen(string msg)

    Text {
        id:confirmtext
        text: qsTr("Are you sure you want to quit?")
        anchors.centerIn: parent
    }

    Button{                                         //yes button, if clicked, quit the app
        text: qsTr("yes")
        width: Screen.width/4.5
        height: width/4
        x: Screen.width/4.5
        y: Screen.height/2+confirmtext.height
        onClicked:
            Qt.quit()
    }
    Button{                                         //no button, if clicked, go back to mainpage
        text: qsTr("no")
        width: Screen.width/4.5
        height: width/4
        x: Screen.width/4.5*2.5
        y: Screen.height/2+confirmtext.height
        onClicked:
            p_confirm.showScreen("p_main.qml")
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            p_confirm.showScreen("p_main.qml")
        }
    }
}
