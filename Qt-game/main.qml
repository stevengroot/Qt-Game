import QtQuick 2.2
import QtQuick.Window 2.1


Window {        //starting point
    id:mainwindow
    visible: true
    width: Screen.width
    height: Screen.height
    signal showScreen(string msg)

    Loader {
        id: loader
        source: "p_main.qml" //initial screen
    }


    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
}
