import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.1
import QtPositioning 5.3
import "images"


Rectangle  {
    id:p_info
    width: Screen.width
    height: Screen.height
    color: "#fa7d7d"
    property int backpressed
    property int c
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
                p_info.showScreen("p_main.qml")
            }
        }
    }

    Timer {
        interval: 1
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: c=c+1
    }

    Rectangle {
        width: Screen.width
        height: Screen.height-quit.height
        y:quit.height
        color:"#fa7d7d"
        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                backpressed = backpressed+1
                event.accepted = true
                if (backpressed >= xtonumber(sliderect.x)) p_info.showScreen("main.qml");
            }
        }


        Component {
            id: infoDelegate
            Row {
                id: infor
                Text { text: assign(index, 2) + ": " ; color: infor.ListView.view.infor_color }
                Text { text: assign(index, 1) }

            }
        }

        ListView {
            property color infor_color: "#7dfafa"
            model: 50
            delegate: infoDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 6 }
            focus: true
            anchors.fill: parent

        }
    }

    function assign(number, type){

        var a,b;
        switch (number){
        case 0:
            a=Screen.width; b="Screen pixel width"; break;
        case 1:
            a=Screen.height; b="Screen pixel height"; break;
        case 2:
            a=Screen.pixelDensity.toFixed(2); b="Screen pixel density"; break;
        case 3:
            a=Screen.logicalPixelDensity.toFixed(2); b="Logical pixel density"; break;
        case 4:
            a=rect.y; b="Rectangle Y-coördinates"; break;
        case 5:
            a=rect.x; b="Rectangle X-coördinates "; break;
        case 6:
            a=rect.color; b="Rectangle color"; break;
        case 7:
            a=rect.opacity.toFixed(2); b="Rectangle opacity"; break;
        case 8:
            a=backpressed; b="Times back is pressed"; break;
        case 9:
            a=xtonumber(sliderect.x).toFixed(2); b="Times needed to go back"; break;
        case 10:
            a=orientationToString(Screen.primaryOrientation); b="Screen orientation"; break;
        case 11:
            a=c; b="Time in this page in ms"; break;
        case 12:
            a=Screen.name; b="Screen name?"; break;
        case 13:
            a=src.coordlat; b="Latitude"; break;
        case 14:
            a=src.coordlong; b="Longitude"; break;
        default:
            a=0; b=""; break;
        }
        if (type === 1) return a;
        else return b;
    }


    function orientationToString(o) {
        switch (o) {
        case Qt.PrimaryOrientation:
            return "primary";
        case Qt.PortraitOrientation:
            return "portrait";
        case Qt.LandscapeOrientation:
            return "landscape";
        case Qt.InvertedPortraitOrientation:
            return "inverted portrait";
        case Qt.InvertedLandscapeOrientation:
            return "inverted landscape";
        }
        return "unknown";
    }
    Rectangle  {
        id: rect
        width: 200; height: 200
        color: "#7dbcfa"
        anchors.right:p_info.right
        opacity: (p_info.height - rect.y) / p_info.height
        y:0
        MouseArea  {
            anchors.fill: parent
            drag.target: rect
            drag.axis: Drag.YAxis
            drag.minimumY: 0
            drag.maximumY: p_info.height - rect.height
            onClicked: {
                animateColor.start()
                animateOpacity.start()
            }
        }
    }

    PropertyAnimation {id: animateColor; target: rect; properties: "color"; to: "green"; duration: 100}

    NumberAnimation {
        id: animateOpacity
        target: rect
        properties: "opacity"
        from: 0.99
        to: 1.0
        loops: Animation.Infinite
        easing {type: Easing.OutBack; overshoot: 500}
    }

    Text {
        id: recttext
        anchors{
            top: rect.bottom
            right: rect.right
        }
        font.bold: true
        color: "#7dbcfa"
        style: Text.Outline; styleColor: "black"
        text: "Rectangle"
    }
    Rectangle  {
        id: sliderect
        width: 200; height: 200
        color: "#7dbcfa"
        y: Screen.height-(20*Screen.pixelDensity/3 + sliderect.height)
        MouseArea  {
            focus:true
            anchors.fill: parent
            drag.target: sliderect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: p_info.width - sliderect.width
        }
    }
    Text {
        id: sliderecttext
        anchors{
            bottom: sliderect.top
            left: sliderect.left
        }
        font.bold: true
        color: "#7dbcfa"
        style: Text.Outline; styleColor: "black"
        text: "Rectangle"
    }
    function xtonumber(q) {
        var a = (q / Screen.width) * 10 + 1;
        return a;
    }

    PositionSource {
        id: src
        property double coordlat
        property double coordlong
        updateInterval: 1000
        active: true
        onPositionChanged: {
            var coord = src.position.coordinate;
            coordlat = coord.latitude
            coordlong = coord.longitude
            console.log("Coordinate:", coord.longitude, coord.latitude);
        }
    }
}

