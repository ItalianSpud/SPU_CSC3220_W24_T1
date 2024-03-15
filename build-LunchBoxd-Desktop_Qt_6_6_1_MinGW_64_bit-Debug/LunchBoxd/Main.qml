import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import "Database.js" as JS

ApplicationWindow {
    id: main
    width: 1200
    height: 800
    visible: true
    title: "Main Screen"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        // get input from user
        InputData {
            id: input
            //Layout.fillWidth: true
        }

        // add recipe data from input to DB
        Button {
            text: "Add Recipe"
            onClicked: {
                if(input.insertRecord()) {
                    // Successfully inserted a row.
                    input.setListView()
                }
            }
        }

        // add recipe data from input to DB
        /*Button {
            text: "Read Recipes"
            onClicked: {
                JS.dbReadRecipes()
                console.log(listModel)
            }
        }*/

        GridView {
            id: listView
            Layout.fillWidth: true
            height: 300
            //Layout.fillHeight: true
            model: Model {}
            delegate: Delegate {
                width: listView.width
                onClicked: ()=> listView.currentIndex = index
            }

            header: Component {
                RowLayout {
                    width: GridView.view.width
                    Repeater {
                        model: [qsTr("Date"), qsTr("Title"), qsTr("Description")]
                        delegate: Label {
                            id: headerTitleDelegate

                            required property string modelData

                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 1
                            text: modelData
                            font {
                                pointSize: 15
                                bold: true
                                underline: true
                            }
                            padding: 12
                            horizontalAlignment: Label.AlignHCenter
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        JS.dbInit()
        //listView.model.setProperty(listView.currentIndex, "id", 0)
        //JS.dbDeleteAll()
        console.log("Init")
    }
}
