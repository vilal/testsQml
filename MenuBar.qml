import QtQuick 2.0    


Rectangle {
    id : menuBar
   width : 600
   height : 400

    Rectangle {
        id: labelList
        z: 1

        width : parent.width
        height : 100


        Row {

            anchors.centerIn: parent
            spacing: 10

            Button {
                buttonText: "File"
                id: fileButton
                onButtonClick: menuListView.currentIndex = 0
                
                }

            Button {
                id: editButton
                buttonText: "Edit"
                onButtonClick: menuListView.currentIndex = 1
                
            }
        }
    }


    Rectangle{
        
        width : parent.width
        height : 70

        VisualItemModel{
            id: menuListModel

            FileMenu{
                width: menuListView.width
                height: menuBar.height
               
            }

            EditMenu{
                width:  menuListView.width
                height: menuBar.height
                
            }
       }

       ListView{
            id: menuListView

            //Anchors are set to react to window anchors
            anchors.fill:parent
            anchors.bottom: parent.bottom
            width:parent.width
            height: parent.height
            anchors.leftMargin: 20

            //the model contains the data
            model: menuListModel

            //control the movement of the menu switching
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            flickDeceleration: 5000
            highlightFollowsCurrentItem: true
            highlightMoveDuration:500
            highlightRangeMode: ListView.StrictlyEnforceRange
       }
    }
}