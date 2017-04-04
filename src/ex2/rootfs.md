# 完善根文件系统

### 创建目录

内核需要挂载一些虚拟文件系统，用于与用户态程序交换信息，这些文件系统仅在运行时会被挂载，并不占用磁盘空间，我们需要在文件系统中创建这些目录：

```
# mkdir -pv /usr/local/mini-os/rootfs/{dev,proc,sys,run}
```

### 创建初始设备节点

系统初始化依赖于几个设备节点，我们需要逐个创建它们：

```
# cd /usr/local/mini-os/rootfs
# mknod -m 622 ./dev/console c 5 1
# mknod -m 666 ./dev/null c 1 3
# mknod -m 666 ./dev/zero c 1 5
# mknod -m 666 ./dev/ptmx c 5 2
# mknod -m 666 ./dev/tty c 5 0
# mknod -m 666 ./dev/ttyS0 c 4 64
```
### 创建init程序

为了降低复杂度，我们自定义一个简单的sh脚本作为初始进程。创建并编辑`/usr/local/mini-os/rootfs/init`文件，写入以下内容：

```
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
echo -e "\nBoot took $(cut -d' ' -f1 /proc/uptime) seconds.\n"
exec /bin/sh
```

赋予可执行权限：

```
# chmod +x init
```

### 打包文件系统

为了让QEMU读取文件系统，我们需要对文件系统进行打包：

```
cd /usr/local/mini-os/rootfs
find . | cpio -oHnewc | gzip > ../initramfs.gz
```