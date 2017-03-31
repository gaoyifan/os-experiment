# 写在后面

如果希望这个操作系统运行在裸金属中，需要开启额外的内核编译选项（主要是驱动程序），以及安装引导器（如GRUB）。如果大家对此感兴趣，可以Linux From Scratch手册（见参考资料），当然，也欢迎与助教交流讨论。

由于本实验主旨是为了精简Linux操作系统内核，因此我们没有创建一个完整的根文件系统。如果要让操作系统正常运行，还需要创建许多配置文件，如`/etc/inittab`, `/etc/passwd`, `/etc/group`, …  具体可以参考Linux From Scratch手册。

## 参考资料

1. [Linux From Scratch](http://www.linuxfromscratch.org/lfs/view/stable/)

