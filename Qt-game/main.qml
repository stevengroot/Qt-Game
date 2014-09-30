import QtQuick 2.2
import QtQuick.Window 2.1


Window {
    id:mainwindow
    visible: true
    width: Screen.width
    height: Screen.height
    signal showScreen(string msg)
    Loader {
        id: loader
        source: "p_main.qml"
    }


    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            mainwindow.showScreen("p_confirm.qml")
        }
    }
}
