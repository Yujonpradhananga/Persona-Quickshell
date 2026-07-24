<h1 align="center">Persona Quickshell</h1>

<div align="center">

[![QML](https://img.shields.io/badge/QML-Quickshell-7aa2f7?style=for-the-badge&logo=qt&logoColor=white)](https://quickshell.outfoxxed.me)
[![Stars](https://img.shields.io/github/stars/Yujonpradhananga/Persona-Quickshell-?style=for-the-badge&color=e0af68&logoColor=white)](https://github.com/Yujonpradhananga/Persona-Quickshell-/stargazers)
[![Hyprland](https://img.shields.io/badge/Hyprland-supported-2ac3de?style=for-the-badge&logoColor=white)](https://hyprland.org)
[![Last Commit](https://img.shields.io/github/last-commit/Yujonpradhananga/Persona-Quickshell-?style=for-the-badge&color=9ece6a&logoColor=white)](https://github.com/Yujonpradhananga/Persona-Quickshell-/commits/main)

</div>



<https://github.com/user-attachments/assets/7e6fd291-dd28-48fa-83aa-81556558b132>







---

## Dependencies

### Plugins

A custom cava plugin is used here:
**Link:** <https://github.com/Yujonpradhananga/Qt6-Cava-plugin>

You can build the plugin mannually or if you dont want to mannually build it and go through the installation process you can delete the `CavaVisualizer.qml` file and delete these lines 171-180 from the `WallpaperEngine.qml` file:

```qml
//delete these
CavaVisualizer {
  id: s1_cava
  anchors {
    left: parent.left
    right: parent.right
    top: parent.top
    topMargin: 0
  }
  height: 555
}
```
---

## AppLauncher

The AppLauncher requires a hyprland keybind for it to work.
Mine is set like this:

```lua
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd("qs -c /path to where you have installed the repo/Persona-Quickshell/ ipc call searchapp toggle")
)
```

---

## Credits
The wallpaper is from : https://steamcommunity.com/sharedfiles/filedetails/?id=3151551777

The greyscale shader is from [@snes19xx](https://github.com/snes19xx)'s [surface-dots](https://github.com/snes19xx/surface-dots/blob/main/.config/hypr/shaders/reading_mode.glsl).

The media player's album art implementation is taken from [Rexcrazy804](https://github.com/Rexcrazy804)'s [Zaphkiel](https://github.com/Rexcrazy804/Zaphkiel).

Shoutout to [blairxu13](https://github.com/blairxu13)'s [persona3-website](https://github.com/blairxu13/persona3-website).
## Power Menu

The power menu currently uses loginctl commands, feel free to change them to your needs.

---

## License

MIT License - feel free to use and modify as needed.

Created by Yujon Pradhananga
