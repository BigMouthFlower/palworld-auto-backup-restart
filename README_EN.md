# Palworld automatically backup and restart on Windows
中文版：
- [中文](README.md)
## Introduction
For those who run Palworld server on Windows. To automatically backup the save and restart the server.
When you download this script, you will need to modify the following content according to your own situation:

1.Change `palworld_path` to the root directory of the Palworld files on your server. Generally, the `Steam\steamapps\common\PalServer` part is fixed, you need to modify the part before it.
```
set "palworld_path=C:\Program Files (x86)\Steam\steamapps\common\PalServer"
```
2.Change `backup_path` to your save backup directory. This depends on you, choose a directory on a disk with enough space.
```
set "backup_path=C:\Users\Administrator\Desktop\backup"
```
3.Change `interval` to the interval you want for server backups and restarts, measured in seconds. One hour is 3600 seconds, depending on the performance of your server and the needs of the members.
```
set interval=10800
```
After using the script, there is no need to manually start the game server; you only need to start this script to start the game. If you want to shut down the server, simply close this script and the server.

After a restart, all players on the server will be disconnected, but the restart time is very short. After disconnecting, players can reconnect to the server.
