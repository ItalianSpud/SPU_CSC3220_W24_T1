import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import "Database.js" as JS

Item {
    id: root
    signal statusMessage(string msg)

    width: Screen.width / 2

    // insert a recipe into the database
    function insertRecord() {
        const rowid = parseInt(JS.dbInsertRecipe(dateInput.text, titleInput.text, descriptionInput.text, ingredientsInput.text, instructionsInput.text, typeInput.text, 5, 5, 5, creationTimeInput.text), 10)
        if (rowid) {
            listView.model.setProperty(listView.currentIndex, "id", rowid)
            listView.forceLayout()
        }
        return rowid;
    }

    function setListView() {
        listView.model.setProperty(listView.currentIndex, "date",
                                   dateInput.text)
        listView.model.setProperty(listView.currentIndex, "title",
                                   titleInput.text)
        listView.model.setProperty(listView.currentIndex, "description",
                                   descriptionInput.text)
        listView.model.setProperty(listView.currentIndex, "ingredients",
                                   ingredientsInput.text)
        listView.model.setProperty(listView.currentIndex, "instructions",
                                   instructionsInput.text)
        listView.model.setProperty(listView.currentIndex, "type",
                                   typeInput.text)
        //review properties
        listView.model.setProperty(listView.currentIndex, "creationTime",
                                   creationTimeInput.text)
    }

    Rectangle {
        id: rootrect
        border.width: 10
        color: "#161616"

        ColumnLayout {
            id: mainLayout
            anchors.fill: parent

            // input date
            TextField {
                id: dateInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true

                ToolTip {
                    x: parent.width + 3
                    y: (parent.height - height) / 2
                    text: qsTr("Date format = 'YYYY-MM-DD'")
                    visible: dateInput.enabled && dateInput.hovered
                    delay: 1000
                }

                validator: RegularExpressionValidator {
                    regularExpression: /\d{4}[,.:/-]\d\d?[,.:/-]\d\d?/
                }

                onFocusChanged: function() {
                    if (!dateInput.focus && !acceptableInput && root.enabled)
                        root.statusMessage(qsTr("Please fill in the date"));
                }

                onEditingFinished: function() {
                    const regex = /(\d+)[,.:/-](\d+)[,.:/-](\d+)/
                    if (dateInput.text.match(regex))
                        dateInput.text = dateInput.text.replace(regex, '$1-$2-$3')
                }
            }

            // input title
            TextField {
                id: titleInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }

            // input description
            TextField {
                id: descriptionInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }

            // input ingredients
            TextField {
                id: ingredientsInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }

            // input instructions
            TextField {
                id: instructionsInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }

            // input type
            TextField {
                id: typeInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }

            // input creationTime
            TextField {
                id: creationTimeInput
                font.pixelSize: 22
                activeFocusOnPress: true
                activeFocusOnTab: true
            }
        }
    }
}
