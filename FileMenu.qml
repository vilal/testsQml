import QtQuick 2.0

Rectangle{

    width : 700
    height: 300


    Row{
        anchors.centerIn: parent
        spacing : parent.width/20


        Button{
            id: loadButton
            buttonColor: "lightgrey"
            buttonText : "Load"
        }
        Button{
            id: saveButton
            buttonColor: "grey"
            buttonText : "Save"
        }
        Button{
            id: exitButton
            buttonColor: "darkgrey"
            buttonText: "Exit"

            onButtonClick : Qt.quit()
        }

    }

}