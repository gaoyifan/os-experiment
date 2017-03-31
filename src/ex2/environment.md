# 准备环境

为了避免环境不同所导致的编译错误，建议大家遵循本节内容准备一个用于编译目标操作系统的编译环境。

如果使用的操作系统是ubuntu 16.04，则可以直接跳至[更新仓库索引](#更新仓库索引)部分。

## 获取基础镜像

### 下载镜像压缩包

从Ubuntu官网下载[Ubuntu 16.04.2 Base Image(AMD64)](http://cdimage.ubuntu.com/ubuntu-base/releases/16.04/release/ubuntu-base-16.04.2-base-amd64.tar.gz)：

```
# wget -O /opt/ubuntu-base-16.04.2-base-amd64.tar.gz http://cdimage.ubuntu.com/ubuntu-base/releases/16.04/release/ubuntu-base-16.04.2-base-amd64.tar.gz
```

如果下载速度较慢，亦可从科大开源软件镜像站下载：

```
# wget -O /opt/ubuntu-base-16.04.2-base-amd64.tar.gz http://mirrors.ustc.edu.cn/ubuntu-cdimage/ubuntu-base/releases/16.04/release/ubuntu-base-16.04.2-base-amd64.tar.gz
```

### 解压

解压镜像到`/opt/ubuntu`

```
# mkdir -pv /opt/ubuntu
# cd /opt/ubuntu
# tar xpzf ../ubuntu-base-16.04.2-base-amd64.tar.gz
```

## 切换根目录前的准备

### 配置DNS

将本机的DNS配置复制到新的rootfs中：

```
# cp -v /etc/resolv.conf /opt/ubuntu/etc/resolv.conf
```

## 修改软件仓库地址（可选）

为了加快下载速度，可以将官方源地址修改为[科大开源镜像站](https://mirrors.ustc.edu.cn)提供的镜像地址：

```
# wget -O /opt/ubuntu/etc/apt/sources.list https://mirrors.ustc.edu.cn/repogen/conf/ubuntu-http-4-xenial
```

## 安装编译环境

### 改变根目录

下面的命令将改变根目录`/`所代表的实际指向，我们需要将其修改为刚才解压得到的ubuntu镜像：

```
# chroot /opt/ubuntu /bin/bash
```

第二个参数`/bin/bash`表示在新的根目录环境中执行的命令。在这里，我们启动了一个bash shell。

**请特别注意：下面的命令都将在新的根目录中执行！**

### 更新仓库索引

```
# apt update
```

### 安装软件包

安装编译器及其他一些工具

```
# apt install -y build-essential libncurses5-dev libgimp2.0-dev bc curl cpio
```

安装文本编辑器

```
# apt install -y nano
```

P.S. 如果需要使用vim（emacs类似），请将命令修改为`apt install -y vim`