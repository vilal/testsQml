import QtQuick 2.0    

Rectangle {

	width: 680; height: 320
	color: "pink"

 	Row {
        anchors.centerIn: parent
       
        spacing: parent.width / 20

        MyBeautifulButton_1 {
            id: loadButton
            buttonColor: "lightgrey"
            buttonText: "Load"
        }
        MyBeautifulButton_1 {
            buttonColor: "grey"
            id: saveButton
            buttonText: "Save"
        }
        MyBeautifulButton_1 {
            id: exitButton
            buttonText: "Exit"
            buttonColor: "darkgrey"

            onButtonClick: Qt.quit()
        }
    }

}

