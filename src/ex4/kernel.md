# 编译目标内核

为了构建测试环境，我们需要编译目标内核。编译方法与[实验二](ex2/kernel.md)类似。

## 获取源代码

从kernel.org获取目标版本的内核代码：

```shell
git clone -b v4.4.25 git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
```

也可以从科大镜像站获取：

```
git://mirrors.ustc.edu.cn/linux.git
```

注：对于`git clone`命令，可以使用`--depth`参数限制获取提交的深度，以减少clone时间。即：`git clone --depth=1 ...`。

## 编译

获取内核配置文件：

```shell
cd linux-stable
curl -o .config https://gaoyifan.github.io/os-experiment/ex4/config
```

以上内核配置文件来源于ubuntu官方内核。开启了较多的选项，编译可能花费较长时间。

编译并打包：

```
make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-exploit
```

如果使用QEMU测试内核，直接生成bzImage即可，无需打包成debian package：

```
make -j `getconf _NPROCESSORS_ONLN`
```

注1：`-j`参数表示并行执行的任务数。建议配置为CPU线程数。

注2：`getconf _NPROCESSORS_ONLN`命令可以获得CPU核心数量。

注3：编译过程将产生较多的临时文件。建议预留20G磁盘空间。

## 安装

```shell
dpkg -i linux-4.4.25-exploit_4.4.25-poc-1.debian.tar.gz
```
