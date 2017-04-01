# 实验三

本实验为开放性编程实验，不限制程序功能。需要使用C语言实现三种不同的进程间通讯(Inter-Process Communication)方法。

常见的进程间通讯方式有：

* 消息队列（Message queues）
* 信号量（Semaphores）
* 共享内存（Shared memory）
* 套接字（Sockets）
* 内存映射（Mapped Memory）
* 命名管道（FIFOS）
* 管道（Pipe）

## 实验要求

* 使用**C语言**编写3个程序
* 每个程序使用一种不同的进程间通讯方法
* 每个程序可以包含一个或多个可执行文件（即：可以是同一个程序的不同进程间的通讯，也可以是不同程序的进程间的通讯）
* 每个程序源代码**不超过**500行
* 程序能够在Linux操作系统中编译、执行
* 撰写一份说明文档描述你的作业，至少包含：
  - 每个程序的功能描述
  - 每个程序源代码的存放位置
  - 如何编译、运行

## 编译环境

Ubuntu 16.04.2 core，包含以下包：

* build-essential（包含了gcc, make等工具）
* cmake
* autoconf
* automake

如果编译需要其他工具（包），请在说明文件中指出。

## 参考资料

1. [Advanced Linux Programming](http://advancedlinuxprogramming.com/alp-folder/alp-ch05-ipc.pdf)
2. [The Linux Programmer's Guide](http://tldp.org/LDP/lpg/node7.html)