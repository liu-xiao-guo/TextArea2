import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "textareatest.ubuntu"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: 450
    height: 600

    Page {
        title: i18n.tr("Simple")
        clip:true

        Button {
            id: button
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: textArea.top

            text: "Get contentY"

            onClicked: {
                console.log("it is clicked!");

                // Get hold all of the children of the textArea
                var count = textArea.children.length
                console.log("length: " + count);

                for(var i=0; i < count; i++) {
                    var contentY = textArea.children[i].contentY;

                    if ( contentY === undefined) {
                        console.log("there is no contentY");
                    } else {
                        console.log("contentY: " + contentY);
                    }
                }
            }
        }

        MyTextArea {
            id: textArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 450

            readOnly: true
            wrapMode: TextEdit.Wrap
            text: "this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n
                   this is cool!\n"

            onContentHeightChanged: {
                console.log("ContentHeight: " + contentHeight);
                console.log("height: " + height);
            }

            onContentYChanged: {
                console.log("contentY: " + contentY);
            }
        }
    }
}

