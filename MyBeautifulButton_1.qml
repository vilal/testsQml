import QtQuick 2.0

Rectangle{
    id: button
    property color buttonColor: "lightblue"
    property color onHoverColor: "gold"

    property color borderColor: "white"
    
    property string buttonText: "Hey je suis un bouton!"

    width: 150; height: 75 


    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor

    Text{
    id: buttonLabel
    anchors.centerIn: parent
    text: buttonText
}
    signal buttonClick()
 
    onButtonClick: {
        console.log(buttonLabel.text + " clicked")
    }
    MouseArea{
        id : buttonMouseArea
        anchors.fill : parent
        onClicked: buttonClick()
        hoverEnabled: true
        onEntered: parent.border.color = onHoverColor
        onExited:  parent.border.color = borderColor
    }

}