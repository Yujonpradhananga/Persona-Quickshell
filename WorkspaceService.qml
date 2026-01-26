pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

Singleton {
    id: root




    readonly property bool isHyprland: Hyprland.connected


    property int activeWorkspaceId: isHyprland ? (Hyprland.focusedWorkspace?.id ?? 1) : (DwlService.activeTag ?? 1)



    property var windows: []


    function moveToWorkspace(address, workspaceId) {
        if (isHyprland) {
            Hyprland.dispatch(`movetoworkspacesilent ${workspaceId},address:${address}`)
        } else {

             DwlService.moveToTag(DwlService.activeOutput, workspaceId - 1)
        }
    }
    

    function switchToWorkspace(workspaceId) {
        if (isHyprland) {
            Hyprland.dispatch(`workspace ${workspaceId}`)
        } else {



             DwlService.switchToTag(DwlService.activeOutput, workspaceId - 1)
        }
    }




    Connections {
        target: Hyprland
        enabled: root.isHyprland
        
        function onClientsChanged() {
            root.updateHyprlandWindows()
        }
        function onFocusedWorkspaceChanged() {

        }
    }

    function updateHyprlandWindows() {
        if (!isHyprland) return;

        let newWindows = [];
        let clients = Hyprland.clients;
        
        for (let i = 0; i < clients.length; i++) {
            let client = clients[i];
            newWindows.push({
                address: client.address,
                workspaceId: client.workspace.id,
                class: client.class,
                title: client.title,
                x: client.at[0],
                y: client.at[1],
                width: client.size[0],
                height: client.size[1],
                focus: client.focus
            });
        }
        root.windows = newWindows;
    }


    Connections {
        target: ToplevelManager
        enabled: !root.isHyprland
        
        function onToplevelsChanged() {
            root.updateGenericWindows()
        }
    }

    function updateGenericWindows() {
         if (isHyprland) return;

         let newWindows = [];
         let toplevels = ToplevelManager.toplevels.values;
         let activeWs = root.activeWorkspaceId;

         for (let i = 0; i < toplevels.length; i++) {
             let t = toplevels[i];
             


             
             newWindows.push({
                 address: t.appId + i,
                 workspaceId: activeWs, 
                 class: t.appId,
                 title: t.title,
                 x: 50 + (i * 30),
                 y: 50 + (i * 30),
                 width: 400,
                 height: 300,
                 focus: t.active
             });
         }
         root.windows = newWindows;
    }
    

    Component.onCompleted: {
        if (isHyprland) {
            updateHyprlandWindows();
        } else {
            updateGenericWindows();
        }
    }
    



}
