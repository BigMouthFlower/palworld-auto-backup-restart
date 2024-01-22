# Windows幻兽帕鲁服务器自动备份和重启脚本
English version:
- [English](README_EN.md)
## 介绍
适用于Windows系统开设的幻兽帕鲁服务器，进行存档自动备份和服务端重启。
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
