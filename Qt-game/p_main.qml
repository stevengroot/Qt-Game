import QtQuick 2.2
import QtQuick.Window 2.1
import "images"


Rectangle {
    id:p_main
    width: Screen.width
    height: Screen.height
    signal showScreen(string msg)
    focus:true
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            p_main.showScreen("p_confirm.qml")
        }
    }
    Image {
        id: quit
        source: "images/close.png"
        width : Screen.logicalPixelDensity*20
        height: width
        x:0;y:0;
        MouseArea {
            anchors.fill: parent
            onClicked: {
                p_main.showScreen("p_confirm.qml")
            }
        }
    }

    Image {
        id: settings
        source: "images/settings.png"
        width : Screen.logicalPixelDensity*20
        height: width
        x:Screen.width-settings.width;y:0;
        MouseArea {
            anchors.fill: parent
            onClicked:{
                p_main.showScreen("p_settings.qml")
            }
        }
    }

    Image {
        id: info
        source: "images/info.png"
        width : Screen.logicalPixelDensity*20
        height: width
        x:0;y:Screen.height-(info.height+70);
        MouseArea {
            anchors.fill: parent
            onClicked:{
                p_main.showScreen("p_info.qml")
            }
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}

