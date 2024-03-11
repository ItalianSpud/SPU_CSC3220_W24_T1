import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: main
    width: 1200
    height: 800
    visible: true
    title: "Main Screen"

    Row {
        spacing: 10
        anchors.centerIn: parent

        RecipeCard {
            id: card1

        }
    }
}
