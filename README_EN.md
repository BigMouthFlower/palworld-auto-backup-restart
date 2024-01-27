
# Palworld Server Automatic Backup and Restart Script for Windows
中文版：
- [中文](README.md)

## Introduction
This is designed for Palworld servers running on Windows systems, providing monitoring, automatic archiving, backup, and server restart capabilities.
The project contains two scripts, `palserver.bat` and `palserver-rcon-monitored.bat`. The former offers automatic archiving, backup, and server restart functionality, while the latter adds monitoring and uses [RCON](https://github.com/radj307/ARRCON/releases/tag/3.3.7) to send countdown commands to the server.

### Script 1: palserver.bat
After downloading the script, you need to modify the following contents according to your situation:

1. Change `palworld_path` to the root directory of your Palworld server. Generally, the part `Steam\steamapps\common\PalServer` does not change; mainly modify the preceding part.
   ```
   set "palworld_path=C:\Program Files (x86)\Steam\steamapps\common\PalServer"
   ```
2. Change `backup_path` to your archive backup directory. Choose a location with sufficient space on your disk to create this directory.
   ```
   set "backup_path=C:\Users\Administrator\Desktop\backup"
   ```
3. Set `interval` to the interval you want for server backup and restart. It is in seconds, with one hour being 3600 seconds, depending on your server's performance and member needs.
   ```
   set interval=10800
   ```
With this script, you no longer need to manually start the game server. Just start this script to start the game. To stop the server, simply close this script and the server.

After restarting, all players on the server will be disconnected. The restart time is short, and players can reconnect to the server after the disconnection.

### Script 2: palserver-rcon-monitored.bat
This script adds monitoring and the ability to send countdown commands to the server via RCON, based on script 1.

#### Prerequisites: RCON Installation Required
RCON is a tool that can send commands to the server, such as countdown commands, allowing the server to automatically restart after the countdown.
Download [RCON](https://github.com/radj307/ARRCON/releases/tag/3.3.7)
After downloading, extract it to your server's root directory, then modify the `rcon_path` in `palserver-rcon-monitored.bat` to the path of your RCON.exe.
```bat
set "rcon_path=C:\ARRCON\ARRCON.exe"
```

#### Detailed Steps:

1. Modify the PalServer configuration to enable RCON. The PalServer configuration file is `PalWorldSettings.ini`, typically located at `\SteamLibrary\steamapps\common\PalServer\Pal\Saved\Config\WindowsServer`. Modify the following:
   ```ini
   RCONEnabled=True
   ```
2. In addition to modifying configurations similar to script 1, you also need to change the RCON configuration in palserver-rcon-monitored.bat:
   ```bat
   set rcon_host=127.0.0.1
   set rcon_port=25575
   set rcon_password=your_password
   ```
3. After starting the script, it will automatically start RCON and then send countdown commands to the server. The server will automatically restart after the countdown.
4. Start the script command:
   ```bat
   palserver-rcon-monitored.bat
   ```
5. To close the script:
   ```bat
   Press Ctrl+C, then type Y, and press Enter to confirm
   ```
