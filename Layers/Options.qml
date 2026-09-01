import QtQuick
import QtMultimedia
import Quickshell
import Quickshell.Wayland
import qs.Widgets as Wid

Scope {
    id: root
    property bool shouldShow: false
    property bool hasShown: false
    onShouldShowChanged: if (shouldShow) hasShown = true
    property var targetScreen: null
    property bool contentVisible: false

    readonly property var barData: [
        {
            role: "LEADER",
            label: "Bluelight",
            char: Qt.resolvedUrl("../Assets/components/char1.png")
        },
        {
            role: "PARTY",
            label: "Greyscale",
            char: Qt.resolvedUrl("../Assets/components/char2.png")
        },
        {
            role: "PARTY",
            label: "Inversion",
            char: Qt.resolvedUrl("../Assets/components/char3.png")
        },
    ]

    Wid.P3rTransition2 {
        id: optionsTransition
    }

    LazyLoader {
        active: root.shouldShow || root.hasShown
        PanelWindow {
            id: optionsWindow
            visible: root.shouldShow
            screen: root.targetScreen
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
            anchors {
                left: true
                right: true
                top: true
                bottom: true
            }
            Connections {
                target: optionsTransition
                function onPeaked() {
                    bgVideo.play();
                    contentVisible = true;
                }
            }
            property int activeBar: 0
            property bool barsRevealed: false

            onVisibleChanged: {
                if (visible) {
                    contentVisible = false;
                    optionsWindow.activeBar = 0;
                    optionsWindow.barsRevealed = false;
                    optionsTransition.targetScreen = root.targetScreen;
                    optionsTransition.shouldShow = true;
                } else {
                    bgVideo.stop();
                    contentVisible = false;
                    optionsWindow.activeBar = 0;
                    optionsWindow.barsRevealed = false;
                }
            }

            Video {
                id: bgVideo
                anchors.fill: parent
                source: Qt.resolvedUrl("../Assets/videos/Options.mp4")
                fillMode: VideoOutput.PreserveAspectCrop
                loops: MediaPlayer.Infinite
                volume: 0
                z: 0
            }

            Item {
                id: contentRoot
                anchors.fill: parent
                z: 3
                visible: root.contentVisible

                MouseArea {
                    anchors.fill: parent
                    z: -1
                    onClicked: root.shouldShow = false
                }

                OptionsList {
                    anchors.fill: parent
                    z: 10
                    activeBar: optionsWindow.activeBar
                    revealed: optionsWindow.barsRevealed
                    mounted: root.contentVisible
                }
                Column {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 6

                    Repeater {
                        model: root.barData

                        delegate: Item {
                            id: barOuter
                            required property var modelData
                            required property int index

                            property bool isActive: index === optionsWindow.activeBar
                            property bool isMounted: root.contentVisible

                            width: barMain.width
                            height: isActive ? 90 : 64
                            Behavior on height {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.OutCubic
                                }
                            }

                            x: isMounted ? 0 : -(barMain.width + 20)
                            Behavior on x {
                                NumberAnimation {
                                    duration: 550
                                    easing.type: Easing.OutCubic
                                }
                            }

                            Rectangle {
                                x: barMain.width * 0.5
                                y: -7
                                width: barMain.width * 0.5 + 18
                                height: parent.height
                                color: "#c4001a"
                                opacity: barOuter.isActive ? 1 : 0
                                Behavior on opacity {
                                    NumberAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            Rectangle {
                                id: barMain
                                width: Math.round(optionsWindow.width * 0.45)
                                height: parent.height
                                color: "#111111"
                                clip: true

                                Rectangle {
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    width: barOuter.isActive ? parent.width * 0.78 : 32
                                    color: "white"
                                    Behavior on width {
                                        NumberAnimation {
                                            duration: 350
                                            easing.type: Easing.OutCubic
                                        }
                                    }

                                    Rectangle {
                                        anchors.left: parent.left
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        width: parent.width * 0.08
                                        opacity: barOuter.isActive ? 1 : 0
                                        Behavior on opacity {
                                            NumberAnimation {
                                                duration: 350
                                            }
                                        }
                                        gradient: Gradient {
                                            orientation: Gradient.Horizontal
                                            GradientStop {
                                                position: 0.0
                                                color: "#26000000"
                                            }
                                            GradientStop {
                                                position: 1.0
                                                color: "transparent"
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    height: 6
                                    z: 10
                                    gradient: Gradient {
                                        GradientStop {
                                            position: 0.0
                                            color: "transparent"
                                        }
                                        GradientStop {
                                            position: 1.0
                                            color: "#8c000000"
                                        }
                                    }
                                }

                                Image {
                                    source: barOuter.modelData.char
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    x: 110
                                    width: 160
                                    fillMode: Image.PreserveAspectCrop
                                    verticalAlignment: Image.AlignTop
                                    z: 3
                                }

                                Row {
                                    anchors.fill: parent
                                    anchors.leftMargin: 20
                                    anchors.rightMargin: 20
                                    z: 4

                                    Text {
                                        text: barOuter.modelData.role
                                        font.family: bebasNeue.name
                                        font.pixelSize: 50
                                        color: "white"
                                        rotation: -30
                                        transformOrigin: Item.Center
                                        height: parent.height
                                        width: 60
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    Item {
                                        width: parent.width - 60 - 20
                                        height: parent.height
                                        Text {
                                            anchors.centerIn: parent
                                            text: barOuter.modelData.label
                                            font.family: bebasNeue.name
                                            font.pixelSize: 28
                                            color: barOuter.isActive ? "#111111" : "#d9ffffff"
                                            Behavior on color {
                                                ColorAnimation {
                                                    duration: 200
                                                }
                                            }
                                        }
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: !optionsWindow.barsRevealed
                                    z: 5
                                    onEntered: optionsWindow.activeBar = barOuter.index
                                    onClicked: {
                                        optionsWindow.activeBar = barOuter.index;
                                        optionsWindow.barsRevealed = true;
                                    }
                                }
                            }
                        }
                    }
                }

                Column {
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 28
                    spacing: 5
                    opacity: root.contentVisible ? 1 : 0
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 400
                        }
                    }

                    Repeater {
                        delegate: Row {
                            required property var modelData
                            spacing: 8
                            layoutDirection: Qt.RightToLeft
                            Text {
                                text: modelData.hint
                                font.family: bebasNeue.name
                                font.pixelSize: 13
                                color: "#38ffffff"
                            }
                            Rectangle {
                                color: "transparent"
                                border.color: "#26ffffff"
                                border.width: 1
                                radius: 3
                                width: keyLabel.width + 12
                                height: keyLabel.height + 4
                                Text {
                                    id: keyLabel
                                    anchors.centerIn: parent
                                    text: modelData.key
                                    font.family: bebasNeue.name
                                    font.pixelSize: 11
                                    color: "#38ffffff"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
