import QtQuick 2.2
import QtQuick.Window 2.1
import "images"


Rectangle {
    id:mainpage
    width: Screen.width
    height: Screen.height

    signal showScreen(string msg)

    Image {
        id: quit
        source: "images/close.png"
        width : Screen.logicalPixelDensity*20
        height: width
        x:0;y:0;
        MouseArea {
            anchors.fill: parent
            onClicked: {
                mainpage.showScreen("confirm.qml")
                //Qt.quit();
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
                mainpage.showScreen("settings.qml")
            }
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            settingswindow.showScreen("confirm.qml")
        }
    }
}

