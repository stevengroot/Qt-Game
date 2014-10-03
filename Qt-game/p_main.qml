import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Particles 2.0
import "images"


Rectangle {
    id:p_main
    width: Screen.width
    height: Screen.height
    signal showScreen(string msg)
    color:"darkgray"
    focus:true

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {        //if backbutton is pressed
            event.accepted = true
            p_main.showScreen("p_confirm.qml")  //go to confirm page
        }
    }

    Rectangle{
        id: topbar
        height: Screen.logicalPixelDensity*15
        width: Screen.width
        color:"lightgray"


        Image {     //quit botton
            id: quit
            source: "images/close.png"
            width : topbar.height
            height: topbar.height
            x:0;y:0;
            MouseArea {
                anchors.fill: parent
                onClicked: {                        //if button is clicked, go to confirm page
                    customEmit((quit.x+quit.width/2),(quit.y+quit.height/2) );
                    timer3.start()
                }
            }
        }

        Timer {
            id:timer3
            interval: 200
            triggeredOnStart: false
            running: false
            repeat: false
            onTriggered: p_main.showScreen("p_confirm.qml")
        }

        Image {                                     //settings button
            id: settings
            source: "images/settings.png"
            width : topbar.height
            height: topbar.height
            anchors.right:topbar.right
            MouseArea {
                anchors.fill: parent
                onClicked:{                         //if button is clicked, go to settings page
                    customEmit((settings.x+settings.width/2),(settings.y+settings.height/2) );
                    timer1.start()
                }
            }
        }

        Timer {
            id:timer1
            interval: 200
            triggeredOnStart: false
            running: false
            repeat: false
            onTriggered: p_main.showScreen("p_settings.qml")
        }
    }
    Image {                                     // info button
        id: info
        source: "images/info.png"
        width : Screen.logicalPixelDensity*15
        height: width
        x:0;y:Screen.height-(info.height+70);
        MouseArea {
            anchors.fill: parent
            onClicked:{                         //if button is clicked, go to info page
                customEmit((info.x+info.width/2),(info.y+info.height/2) );
                timer2.start()
            }
        }
    }
    Timer {
        id:timer2
        interval: 200
        triggeredOnStart: false
        running: false
        repeat: false
        onTriggered: p_main.showScreen("p_info.qml")
    }

    Text {
        text: qsTr("Hello World")               //simple hello world in the middle of the screen
        anchors.centerIn: parent
    }

    function customEmit(x,y) {
        for (var i=0; i<8; i++) {
            var obj = emitterComp.createObject(p_main);
            obj.x = x
            obj.y = y
            obj.targetX = Math.random() * 240 - 120 + obj.x
            obj.targetY = Math.random() * 240 - 120 + obj.y
            obj.life = Math.round(Math.random() * 2400) + 200
            obj.emitRate = Math.round(Math.random() * 32) + 32
            obj.go();
        }
    }
    ParticleSystem {
        id: sys
    }
    ImageParticle {
        system: sys
        source: "images/blur-circle.png"
        color: "black"
        colorVariation: 10
        alpha: 0.1
    }

    Component {
        id: emitterComp
        Emitter {
            id: container
            Emitter {
                id: emitMore
                system: sys
                emitRate: 500
                lifeSpan: 120
                size: 20
                endSize: 8
                velocity: AngleDirection {angleVariation:360; magnitude: 1000}
            }

            property int life: 500
            property real targetX: 0
            property real targetY: 0
            function go() {
                xAnim.start();
                yAnim.start();
                container.enabled = true
            }
            system: sys
            emitRate: 100
            lifeSpan: 120
            size: 30
            endSize: 20
            NumberAnimation on x {
                id: xAnim;
                to: targetX
                duration: life
                running: false
            }
            NumberAnimation on y {
                id: yAnim;
                to: targetY
                duration: life
                running: false
            }
            Timer {
                interval: life
                running: true
                onTriggered: container.destroy();
            }
        }
    }
}

