import QtQuick 2.0

Rectangle {
    id: monBouton
    color: "grey"
    width: 150; height: 75 

    Text {
        id: monTexteDeBouton
        anchors.centerIn: parent // le texte est centré dans son parent
        text: "Texte de Bouton"
    }

     MouseArea {
        id: monAireDeClic

        // Anchor all sides of the mouse area to the rectangle's anchors
        anchors.fill: parent
        // onClicked handles valid mouse button clicks
        onClicked: console.log(monTexteDeBouton.text + " cliqué") // donne "Texte de Bouton cliqué" dans la console
    }
}