import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Recipe Card
Item {
    id: delegate

    required property int index
    required property string date
    required property string title
    required property string description
    required property string ingredients
    required property string instructions
    required property string type
    property int taste: 5
    required property int creationTime
    property int cost: 5
    property int health: 5

    signal clicked()

    width: ListView.view.width
    //implicitHeight: rDate.implicitHeight * 1.5

    Rectangle {
        id: baseRec
        width: 300
        height: 250
        color: "tomato"

        MouseArea {
            anchors.fill: parent
            onClicked: delegate.clicked()
        }

        RowLayout {
            anchors.fill: parent

            Text {
                id: name
                anchors.top: typeImage.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 30
                text: delegate.title
            }
            Text {
                id: ratingsRow1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.verticalCenter
                font.pointSize: 20
                text: qsTr("Taste: " + delegate.taste + " Time: " + delegate.creationTime)
                //text: delegate.date
            }

            Text {
                id: ratingsRow2
                anchors.top: ratingsRow1.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                text: qsTr("Cost: " + delegate.cost + " Health: " + delegate.health)
                //text: delegate.description
            }

            /*Label {
                id: rDate
                Layout.preferredWidth: 42
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                text: delegate.date
                font.pixelSize: 22
                color: "black"
            }

            Label {
                Layout.preferredWidth: 42
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                text: delegate.title
                font.pixelSize: 22
                color: "black"
            }

            Label {
                Layout.preferredWidth: 42
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                text: delegate.description
                font.pixelSize: 22
                color: "black"
            }*/
        }
    }
}
