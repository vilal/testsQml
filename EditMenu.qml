import QtQuick 2.0

Rectangle{

    width : 700
    height: 300

    Row{
       spacing : parent.width/20
       anchors.centerIn: parent
       Button{
            id: copyButton
            buttonColor: "pink"
            buttonText: "Copy"
                   
        }
        Button{
            id: pasteButton
            buttonColor: "yellow"
            buttonText: "Paste"
        }
        Button{
            id: selectButton
            buttonColor: "red"
            buttonText : "Select all"
        }
    }

}