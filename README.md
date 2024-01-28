# Windows幻兽帕鲁服务器自动备份和重启脚本
English version:
- [English](README_EN.md)
## 介绍
适用于Windows系统开设的幻兽帕鲁服务器，进行监控，存档自动备份和服务端重启。
本项目包含两个脚本，分别为`palserver.bat`和`palserver-rcon-monitored.bat`，前者提供存档自动备份和服务端重启功能，后者增加了监控和利用[RCON](https://github.com/radj307/ARRCON/releases/tag/3.3.7)向服务器发送倒计时功能。

### 脚本1：palserver.bat
下载脚本后，你需要根据你自己的情况修改如下内容：

1.将`palworld_path`改为你服务器上幻兽帕鲁文件的根目录，一般来说`Steam\steamapps\common\PalServer`这一部分不会有变化，主要是修改前面的部分。
```
set "palworld_path=C:\Program Files (x86)\Steam\steamapps\common\PalServer"
```
2.将`backup_path`修改为你的存档备份目录，这个取决于你，选择一个有足够空间的磁盘创建目录
```
set "backup_path=C:\Users\Administrator\Desktop\backup"
```
3.将`interval`设为你希望的服务器备份和重启间隔，单位是秒，一小时是3600秒，取决于你服务器的性能和成员需求。
```
set interval=10800
```
使用脚本后就不用手动启动游戏服务端了，只需要启动这个脚本即可启动游戏。如果要关闭服务器，关闭这个脚本和服务端即可。

重启后所有在服务器玩的玩家会断开连接，重启时间很短，断开后玩家重新连接服务器即可。

### 脚本2：palserver-rcon-monitored.bat
这个脚本在脚本1的基础上增加了监控和利用RCON向服务器发送倒计时功能。

#### 前置条件：需要安装RCON
RCON是一个可以向服务器发送命令的工具，可以用来向服务器发送倒计时命令，让服务器在倒计时结束后自动重启。
下载[RCON](https://github.com/radj307/ARRCON/releases/tag/3.3.7)
下载后解压到你的服务器根目录，然后修改`palserver-rcon-monitored.bat`中的`rcon_path`为你的RCON.exe的路径。
```bat
set "rcon_path=C:\ARRCON\ARRCON.exe"
```

#### 以下为详细步骤：

1. 修改PalServer的配置，开启RCON功能。PalServer配置文件为`PalWorldSettings.ini`，一般位于`\SteamLibrary\steamapps\common\PalServer\Pal\Saved\Config\WindowsServer`。修改如下内容：
```ini
RCONEnabled=True
```
2. 除了修改类似脚本1的几个配置外，还需要修改palserver-rcon-monitored.bat中的RCON配置：
```bat
set rcon_host=127.0.0.1
set rcon_port=25575
set rcon_password=your_password
```
3. 启动脚本后，脚本会自动启动RCON，然后向服务器发送倒计时命令，服务器会在倒计时结束后自动重启。
4. 启动脚本命令：
```bat
palserver-rcon-monitored.bat
```
5. 关闭脚本：
```bat
按下Ctrl+C，然后输入Y， 回车确认
```


