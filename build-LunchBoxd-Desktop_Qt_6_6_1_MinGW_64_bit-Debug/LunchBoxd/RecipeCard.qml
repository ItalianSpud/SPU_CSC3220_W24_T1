import QtQuick
import QtQuick.Controls

Rectangle {
    id: card
    width: 300
    height: 250
    color: "tomato"
    Text {
        id: name
        anchors.top: typeImage.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 30
        text: recipeName
    }
    Text {
        id: ratingsRow1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        font.pointSize: 20
        text: ratingValues1
    }

    Text {
        id: ratingsRow2
        anchors.top: ratingsRow1.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20
        text: ratingValues2
    }

    MouseArea {
        anchors.fill: parent
        onClicked: buttonClicked()
    }

    property string recipeName: "insert name"
    property string ratingValues1: "no ratings given"
    property string ratingValues2: "no ratings given"

    signal buttonClicked()
}
