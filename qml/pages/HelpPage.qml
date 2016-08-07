// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../common"

Flickable {
    id: flickable
    // index to get access to Loader (Destination)
    property int myIndex: index
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    property string name: "Help"

    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            RowLayout {
                Image {
                    source: "qrc:/images/extra/qtcon-app.png"
                }
                LabelHeadline {
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Conference2Go\nQtCon 2016, Berlin\n(Qt 5.7 - Android + iOS)")
                    color: primaryColor
                }
            }
            HorizontalDivider {}
            LabelTitle {
                leftPadding: 10
                text: qsTr("Misc")
                color: accentColor
            }
            HelpRow {
                iconName: "menu.png"
                helpText: qsTr("Menu Button: Opens the Drawer. Drawer can also be opened from Gesture: swiping from left site.")
            }
            HelpRow {
                iconName: "more_vert.png"
                helpText: qsTr("Options Button: Opens a Menu")
            }
            HelpRow {
                iconName: "arrow_back.png"
                helpText: qsTr("Back Button: Top/Left from TitleBar goes one Page back. On Android you can also use OS - specific Back Button below the Page.")
            }
            HelpRow {
                iconName: "list.png"
                helpText: qsTr("Speed Navigation: Back to the List below in the stack without the need to move fingers to Top/Right Back Button.")
            }



            HorizontalDivider {}
        } // col layout
    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    // emitting a Signal could be another option
    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        console.log(qsTr("Init done from HELP"))
    }
    // called from Component.destruction
    function cleanup() {
        console.log(qsTr("Cleanup done from HELP"))
    }
} // flickable
