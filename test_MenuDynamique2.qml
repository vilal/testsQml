import QtQuick 2.0
import QtQml 2.1
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0


/*
Problèmes:
--> arriver à convertir une string en nom de fonction (ou inversement à la limite) ou en id.
Comment faire comprendre à Qt que sousmenu: "sousfruitModel"
correspond à l'id sousfruitModel (qui n'est pas une string mais un id)
ou que ontriggered: "Qt.quit()" devrait appeler la fonction Qt.Quit()

--> (comment imbriquer facilement des menus & des sous-menus via ListElement?)

*/


ApplicationWindow
{
    width:800
    height:600

    visible:true

    function selectFile()
    {
        fileChooser.visible=true;

    }
    function myMethod() {
         console.log("Button was clicked!")
     }

     ListModel {
         id: fruitModel

         ListElement {
             name: "Apple"
             cost: 2.45
             sousmenu: "sousfruitModel"
             ontriggered: "Qt.quit()"
         }
         ListElement {
             name: "Orange"
             cost: 3.25


         }
         ListElement {
             name: "Banana"
             cost: 1.95


         }

     }

     ListModel {
         id: sousfruitModel

         ListElement {
             name: "Pomme"
             cost: 2.45
             functionToCall: "actionApple"
         }
         ListElement {
             name: "Orangeade"
             cost: 3.25
             functionToCall: "actionOrange"

         }
         ListElement {
             name: "Banane"
             cost: 1.95
             functionToCall: "actionBanana"

         }
     }


    //menuBar:MenuBar {
        Menu {
            id: dynMenu
            title: "Menu"

            Instantiator {
                model: fruitModel
               Menu {
                    id: dynMenu2
                    title: model.name

                     Instantiator {
//                        model: model.sousmenu
                          model: sousfruitModel
                           MenuItem{
                                text:model.name

                                onTriggered:{
//                                  model.ontriggered
                                    if (model.functionToCall == "selectFile"){
                                        selectFile()
                                    }
                                    else if (model.functionToCall == "actionOrange"){
                                        Qt.quit()
                                    }
                                    else if (model.functionToCall == "actionBanana"){
                                        myMethod()
                                    }
                                     console.log(model.functionToCall+"()")
                                }
                            }
                        // console.log(model.name)
                        //if (model.name == "Apple"){
                            onObjectAdded: dynMenu2.insertItem(index, object)
                            onObjectRemoved: dynMenu2.removeItem(object)
                       //}
                    }
                }
                /*MenuItem{
                    text: model.name
                    onTriggered:{
                        if (model.functionToCall == "actionApple"){
                            selectFile()
                        }
                        else if (model.functionToCall == "actionOrange"){
                            Qt.quit()
                        }
                        else if (model.functionToCall == "actionBanana"){
                            myMethod()
                        }
                         console.log(model.functionToCall+"()")
                    }
                }*/
                onObjectAdded: dynMenu.insertItem(index, object)
                onObjectRemoved: dynMenu.removeItem(object)
            }
        }
   //}
   FileDialog{
        id:fileChooser
        visible:false
        modality:Qt.WindowModal
        title:"Choose data file"
        onAccepted:{
            console.log(fileChooser.fileUrls)
            visible:false
        }
        onRejected:{
            console.log("Cancel")
            visible:false
        }
    }

   MouseArea {
        anchors.fill: parent
        onPressed: dynMenu.popup()
    }
}

