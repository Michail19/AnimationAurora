import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Animation")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Rectangle {
     x: 100
     y: 100
     width: 100
     height: 100
     color: "#FF0000"
    }

    Rectangle {
     x: 200
     y: 150
     width: 100
     height: 100
     color: "#00FF00"

     Rectangle {
      x: 50
      y: -50
      width: 100
      height: 100
      color: "#0000FF"

      Text {
          x: parent.widht / 4
          y: parent.height / 4
          text: "Квадрат"
          color: "#FFFFFF"
      }
     }
   }

    PropertyAnimation {
        id: sizeAnimation
        target: rectangle_anim
        properties: "height"
        to: "400"
        duration: 1000
    }

    Rectangle {
     id: rectangle_anim
     x: 250
     y: 500
     width: 200
     height: 200
     color: "#000000"
     border.color: "#FFFFFF"
     border.width: 5

     MouseArea {
         anchors.fill: parent
         onClicked: {
             parallelAnimation.start()
         }
     }
    }

    ParallelAnimation {
        id: parallelAnimation

        PropertyAnimation {
            target: rectangle_anim
            property: "height"
            to: 400
            duration: 500
        }

        PropertyAnimation {
            target: rectangle_anim
            property: "y"
            to: 400
            duration: 500
        }

        RotationAnimation {
            target: rectangle_anim
            to: 45
            duration: 500
        }
    }
}
