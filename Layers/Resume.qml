import QtQuick
import QtMultimedia
import Quickshell
import Quickshell.Wayland
import qs.Data as Dat
import qs.Widgets as Wid
import qs.Widgets.Info as Info
import QtQuick.Controls

Scope {
    id: root
    property bool shouldShow: false
    property bool hasShown: false
    onShouldShowChanged: if (shouldShow) hasShown = true
    property var targetScreen: null
    property bool contentVisible: false
    Connections {
        target: root
        function onShouldShowChanged() {
            Info.SysInfo.active = root.shouldShow;
            if (root.shouldShow)
                Info.NetInfo.scanNetworks();
        }
    }
    Wid.P3rTransition {
        id: resumeTransition
    }
    LazyLoader {
        active: root.shouldShow || root.hasShown
        PanelWindow {
            id: resumeWindow
            visible: root.shouldShow
            screen: root.targetScreen
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: visible ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
            anchors {
                left: true
                right: true
                top: true
                bottom: true
            }
            onVisibleChanged: {
                if (visible) {
                    contentVisible = false;
                    resumeTransition.targetScreen = root.targetScreen;
                    resumeTransition.shouldShow = true;
                    contentDelayTimer.start();
                } else {
                    resumeVideo.stop();
                    contentVisible = false;
                }
            }
            Video {
                id: resumeVideo
                anchors.fill: parent
                source: Qt.resolvedUrl("../Assets/videos/Resume.mp4")
                fillMode: VideoOutput.PreserveAspectCrop
                loops: MediaPlayer.Infinite
                volume: 0
                z: 0
            }
            Timer {
                id: contentDelayTimer
                interval: 730
                repeat: false
                onTriggered: {
                    resumeVideo.play();
                    contentVisible = true;
                    Qt.callLater(() => {
                        panelBg.requestPaint();
                        detailHeader.requestPaint();
                    });
                }
            }
            Item {
                id: contentRoot
                anchors.fill: parent
                z: 3
                visible: root.contentVisible
                property int activeCard: 0
                Column {
                    anchors {
                        left: parent.left
                        leftMargin: parent.width * 0.028
                        top: parent.top
                        topMargin: parent.height * 0.09
                    }
                    spacing: 10
                    Text {
                        text: "LIST"
                        font.family: "proggyfonts"
                        font.pixelSize: 72
                        color: "#f6fbff"
                        leftPadding: 12
                    }
                    Repeater {
                        model: [
                            {
                                badge: "I",
                                title: "Stats",
                                subtitle: "System Stats and Info",
                                rank: 3
                            },
                            {
                                badge: "II",
                                title: "Network",
                                subtitle: "Wifi Networks and connections",
                                rank: 4
                            },
                            {
                                badge: "III",
                                title: "Bluetooth",
                                subtitle: "Bluetooth Devices",
                                rank: 5
                            },
                        ]
                        Item {
                            id: cardWrap
                            required property var modelData
                            required property int index
                            width: 680
                            height: isActive ? 136 : 112
                            x: isActive ? 6 : 0
                            property bool isActive: contentRoot.activeCard === index

                            Behavior on height {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.OutCubic
                                }
                            }
                            Behavior on x {
                                NumberAnimation {
                                    duration: 250
                                    easing.type: Easing.OutCubic
                                }
                            }

                            Canvas {
                                id: cardCanvas
                                anchors.fill: parent
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.clearRect(0, 0, width, height);
                                    ctx.beginPath();
                                    ctx.moveTo(0, 0);
                                    ctx.lineTo(width * 0.97, 0);
                                    ctx.lineTo(width, height);
                                    ctx.lineTo(width * 0.03, height);
                                    ctx.closePath();
                                    ctx.fillStyle = cardWrap.isActive ? "#8df6ff" : "#10185f";
                                    ctx.fill();
                                    ctx.beginPath();
                                    ctx.moveTo(width * 0.03, height);
                                    ctx.lineTo(width, height);
                                    ctx.lineTo(width + 10, height + 8);
                                    ctx.lineTo(width * 0.03 + 10, height + 8);
                                    ctx.closePath();
                                    ctx.fillStyle = cardWrap.isActive ? "#cccccc" : "rgba(5,13,59,0.85)";
                                    ctx.fill();
                                }
                                onWidthChanged: requestPaint()
                                onHeightChanged: requestPaint()
                                Connections {
                                    target: cardWrap
                                    function onIsActiveChanged() {
                                        cardCanvas.requestPaint();
                                    }
                                }
                                Connections {
                                    target: root
                                    function onContentVisibleChanged() {
                                        if (root.contentVisible)
                                            cardCanvas.requestPaint();
                                    }
                                }
                            }

                            Rectangle {
                                x: -8
                                y: 10
                                width: 52
                                height: 66
                                color: cardWrap.isActive ? "#000" : "#0b113d"
                                border.color: cardWrap.isActive ? "#000" : "#9cf7ff"
                                border.width: 3
                                rotation: -8
                                Text {
                                    anchors.centerIn: parent
                                    text: cardWrap.modelData.badge
                                    font.family: "Montserrat"
                                    font.pixelSize: 28
                                    color: cardWrap.isActive ? "#fff" : "#d2fdff"
                                    rotation: 8
                                }
                            }

                            Text {
                                anchors {
                                    left: parent.left
                                    leftMargin: 62
                                    top: parent.top
                                    topMargin: 14
                                }
                                text: cardWrap.modelData.title
                                font.family: "Montserrat"
                                font.pixelSize: 48
                                color: cardWrap.isActive ? "#000" : "#a5f6ff"
                            }

                            Row {
                                anchors {
                                    right: parent.right
                                    rightMargin: 20
                                    top: parent.top
                                    topMargin: 10
                                }
                                spacing: 8
                                Text {
                                    text: "RANK"
                                    font.family: "Montserrat"
                                    font.pixelSize: 22
                                    color: cardWrap.isActive ? "#000" : "#9ffbff"
                                    anchors.bottom: parent.bottom
                                    bottomPadding: 8
                                }
                                Text {
                                    text: cardWrap.modelData.rank
                                    font.family: "Montserrat"
                                    font.pixelSize: 60
                                    color: cardWrap.isActive ? "#000" : "#9ffbff"
                                }
                            }

                            Canvas {
                                id: subtitleCanvas
                                anchors {
                                    left: parent.left
                                    leftMargin: 64
                                    right: parent.right
                                    rightMargin: 14
                                    bottom: parent.bottom
                                    bottomMargin: 12
                                }
                                height: 32
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.clearRect(0, 0, width, height);
                                    ctx.beginPath();
                                    ctx.moveTo(0, 0);
                                    ctx.lineTo(width, 0);
                                    ctx.lineTo(width - 10, height);
                                    ctx.lineTo(0, height);
                                    ctx.closePath();
                                    ctx.fillStyle = cardWrap.isActive ? "#000" : "#85f4ff";
                                    ctx.fill();
                                }
                                Connections {
                                    target: cardWrap
                                    function onIsActiveChanged() {
                                        subtitleCanvas.requestPaint();
                                    }
                                }
                                Connections {
                                    target: root
                                    function onContentVisibleChanged() {
                                        if (root.contentVisible)
                                            subtitleCanvas.requestPaint();
                                    }
                                }
                                Text {
                                    anchors {
                                        fill: parent
                                        leftMargin: 14
                                    }
                                    text: cardWrap.modelData.subtitle
                                    font.family: "Montserrat"
                                    font.pixelSize: 20
                                    color: cardWrap.isActive ? "#fff" : "#041238"
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            HoverHandler {
                                onHoveredChanged: {
                                    if (hovered)
                                        contentRoot.activeCard = cardWrap.index;
                                }
                            }
                            TapHandler {
                                onTapped: contentRoot.activeCard = cardWrap.index
                            }
                        }
                    }
                }

                Rectangle {
                    id: detailPanel
                    anchors {
                        right: parent.right
                        rightMargin: parent.width * 0.045
                        top: parent.top
                        topMargin: parent.height * 0.095
                    }
                    width: Math.min(parent.width * 0.39, 620)
                    height: parent.height * 0.74
                    color: "transparent"

                    Canvas {
                        id: panelBg
                        anchors.fill: parent
                        Connections {
                            target: root
                            function onContentVisibleChanged() {
                                if (root.contentVisible)
                                    panelBg.requestPaint();
                            }
                        }
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);
                            ctx.beginPath();
                            ctx.moveTo(0, 0);
                            ctx.lineTo(width, 0);
                            ctx.lineTo(width - 18, height);
                            ctx.lineTo(0, height);
                            ctx.closePath();
                            var grad = ctx.createLinearGradient(0, 0, 0, height);
                            grad.addColorStop(0, "rgba(15,28,105,0.96)");
                            grad.addColorStop(1, "rgba(8,16,68,0.97)");
                            ctx.fillStyle = grad;
                            ctx.fill();
                        }
                    }

                    Canvas {
                        id: detailHeader
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                        }
                        height: 92
                        property string indexText: ["01", "02", "03"][detailPanel.parent.activeCard]
                        property string titleText: ["System Stats", "Wifi networks", "Bluetooth devices"][detailPanel.parent.activeCard]
                        onIndexTextChanged: requestPaint()
                        Connections {
                            target: root
                            function onContentVisibleChanged() {
                                if (root.contentVisible)
                                    detailHeader.requestPaint();
                            }
                        }
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);
                            ctx.beginPath();
                            ctx.moveTo(0, 0);
                            ctx.lineTo(width, 0);
                            ctx.lineTo(width - 16, height);
                            ctx.lineTo(0, height);
                            ctx.closePath();
                            var grad = ctx.createLinearGradient(0, 0, width, 0);
                            grad.addColorStop(0, "#8ef5ff");
                            grad.addColorStop(1, "#d3fdff");
                            ctx.fillStyle = grad;
                            ctx.fill();
                        }
                        Row {
                            anchors {
                                fill: parent
                                leftMargin: 18
                                rightMargin: 18
                            }
                            spacing: 14
                            Text {
                                text: detailHeader.indexText
                                font.family: "Montserrat"
                                font.pixelSize: 40
                                color: "#08153f"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: detailHeader.titleText
                                font.family: "Montserrat"
                                font.pixelSize: 36
                                color: "#08153f"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    ScrollView {
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: detailHeader.bottom
                            bottom: parent.bottom
                            topMargin: 18
                        }
                        clip: true

                        Column {
                            id: innerCol
                            width: detailPanel.width
                            spacing: 10

                            Repeater {
                                model: {
                                    var ac = detailPanel.parent.activeCard;
                                    var _ = Info.SysInfo.cpuUsage + Info.SysInfo.memUsage + Info.SysInfo.diskUsage;
                                    return [[
                                            {
                                                title: "OS",
                                                status: Info.SysInfo.osName
                                            },
                                            {
                                                title: "CPU",
                                                status: Math.round(Info.SysInfo.cpuUsage * 100) + "%"
                                            },
                                            {
                                                title: "RAM",
                                                status: Info.SysInfo.memText
                                            },
                                            {
                                                title: "DISK",
                                                status: Info.SysInfo.diskText
                                            },
                                            {
                                                title: "Users",
                                                status: Info.SysInfo.loggedInUsers
                                            },
                                        ], Info.NetInfo.networks.map((n, i) => ({
                                                    title: n.ssid,
                                                    status: n.active ? "Connected" : (n.strength + "%")
                                                })), Info.BluetoothInfo.friendlyDeviceList.length === 0 ? [
                                            {
                                                title: Info.BluetoothInfo.available ? "Bluetooth Off" : "No Adapter",
                                                status: Info.BluetoothInfo.enabled ? "No Devices" : "Disabled"
                                            }
                                        ] : Info.BluetoothInfo.friendlyDeviceList.map(d => ({
                                                    title: d.name,
                                                    status: d.connected ? "Connected" : (d.paired ? "Paired" : "Found")
                                                })), [],][ac];
                                }

                                Item {
                                    required property var modelData
                                    width: detailPanel.width
                                    height: 56

                                    Rectangle {
                                        anchors.fill: parent
                                        color: Qt.rgba(8 / 255, 18 / 255, 72 / 255, 0.96)
                                        radius: 2
                                    }

                                    Row {
                                        anchors {
                                            fill: parent
                                            leftMargin: 14
                                            rightMargin: 14
                                        }
                                        spacing: 14

                                        Text {
                                            text: modelData.title
                                            font.family: "Montserrat"
                                            font.pixelSize: 24
                                            color: "#f2fcff"
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                        Item {
                                            width: 1
                                            height: 1
                                        }
                                        Item {
                                            width: statusText.implicitWidth + 28
                                            height: 34
                                            anchors.verticalCenter: parent.verticalCenter
                                            Canvas {
                                                id: statusCanvas
                                                anchors.fill: parent
                                                onWidthChanged: requestPaint()
                                                Connections {
                                                    target: root
                                                    function onContentVisibleChanged() {
                                                        if (root.contentVisible)
                                                            statusCanvas.requestPaint();
                                                    }
                                                }
                                                onPaint: {
                                                    var ctx = getContext("2d");
                                                    ctx.clearRect(0, 0, width, height);
                                                    ctx.beginPath();
                                                    ctx.moveTo(0, 0);
                                                    ctx.lineTo(width, 0);
                                                    ctx.lineTo(width - 8, height);
                                                    ctx.lineTo(0, height);
                                                    ctx.closePath();
                                                    ctx.fillStyle = "#8df6ff";
                                                    ctx.fill();
                                                }
                                            }
                                            Text {
                                                id: statusText
                                                anchors.centerIn: parent
                                                text: modelData.status
                                                font.family: "Montserrat"
                                                font.pixelSize: 16
                                                color: "#06133b"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    z: -1
                    onClicked: root.shouldShow = false
                }
                Keys.onPressed: event => {
                    if (event.key === Qt.Key_Escape) {
                        root.shouldShow = false;
                        event.accepted = true;
                    }
                }
            }
        }
    }
}
