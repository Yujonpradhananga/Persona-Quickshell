# Persona Quickshell

A custom Quickshell configuration featuring a modern, persona-themed desktop environment.

## Demo

https://github.com/user-attachments/assets/78e3685d-7643-4e5e-ab2d-d2b7f1a44dbb

## Features

- Custom Quickshell widgets and components
- Battery monitoring and management
- Volume and brightness OSD (On-Screen Display)
- Application drawer and launcher
- Workspace management
- Live wallpaper support
- Audio visualizer (Cava integration)
- System stats display

## Components

- **AppDrawer.qml** - Application launcher interface
- **Personabar.qml** - Main status bar
- **Battery.qml** - Battery indicator widget
- **BatteryMonitor.qml** - Battery monitoring service
- **VolumeOsd.qml** - Volume on-screen display
- **BrightnessOsd.qml** - Brightness on-screen display
- **Searchapp.qml** - Application search functionality
- **Cava.qml** - Audio visualizer
- **Livewallpaper.qml** - Animated wallpaper support

## Installation

1. Clone this repository:
```bash
git clone https://github.com/Yujonpradhananga/Persona-Quickshell-.git
```

2. Copy the configuration files to your Quickshell config directory:
```bash
cp -r Persona-Quickshell-/* ~/.config/quickshell/
```

3. Launch Quickshell or restart your existing instance

## Requirements

- Quickshell
- Qt6
- Dependencies listed in individual component files

## Usage

After installation, Quickshell will automatically load the Persona theme. You can customize the configuration by editing the `.qml` files in your config directory.

## License

MIT License - feel free to use and modify as needed.

## Credits

Created by Yujon Pradhananga
