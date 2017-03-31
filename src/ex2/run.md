# 运行操作系统

我们刚才编译的操作系统并不包含引导器，因此无法直接运行在裸金属中。我们这里选择QEMU来运行这个操作系统。

### 安装QEMU

```
# apt install -y qemu-system-x86
```

### 运行操作系统

```
# cd /usr/local/mini-os
# qemu-system-x86_64 -kernel bzImage -initrd initramfs.gz -nographic -append "console=ttyS0"
```

如果终端输出类似：

````
Boot took 0.45 seconds.
/ #
````

则表明操作系统已经成功启动。

注：在宿主机上执行`killall qemu-system-x86_64`可以关闭QEMU模拟器。

到此，实验内容全部结束。
