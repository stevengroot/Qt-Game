import QtQuick 2.2
import QtQuick.Window 2.1


Window {
    id:mainwindow
    visible: true
    width: Screen.width
    height: Screen.height
    Loader {
        id: loader
        source: "mainpage.qml"
    }

    signal showScreen(string msg)

    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
}
