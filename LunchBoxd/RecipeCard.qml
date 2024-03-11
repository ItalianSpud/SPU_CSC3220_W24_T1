import QtQuick
import QtQuick.Controls

Rectangle {
    id: card
    width: 300
    height: 200
    Text {
        anchors.centerIn: parent
        text: recipeName
    }

    MouseArea {
        anchors.fill: parent
        onClicked: buttonClicked()
    }

    property string recipeName: "insert name"

    signal buttonClicked()
}
