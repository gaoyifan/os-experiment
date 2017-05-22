# 使用QEMU测试内核(可选)

由于内核测试存在一定的危险性，极有可能导致内核崩溃。如果在裸金属中测试，当内核崩溃后，需要物理重启计算机，效率较低。因此，建议在虚拟机中进行内核测试。如果Linux系统本身安装在虚拟机中，则可以略过这一部分。

由于qemu十分脚本化测试，且方便替换内核，建议使用qemu作为虚拟软件。如果Linux系统本身安装在虚拟机中，则需要开启Hardware Assisted Virtualization特性，以实现虚拟机的嵌套。

## 参考资料

1. [Rapid Linux Kernel Dev/Test with QEMU, KVM and Dracut](http://blog.elastocloud.org/2015/06/rapid-linux-kernel-devtest-with-qemu.html)
2. [Setting up QEMU-KVM for kernel development](https://www.collabora.com/news-and-blog/blog/2017/01/16/setting-up-qemu-kvm-for-kernel-development/)
3. [Linux内核实验环境](http://tinylab.org/linux-lab/)


