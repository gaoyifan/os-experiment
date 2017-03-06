# 学习使用bash

请大家借助文末参考资料，学习编写bash脚本。

## 编程作业

本次实验需要大家提交一段代码（文件名`hello_linux.sh`），功能如下：

1. 向标准输出打印一行文本`Hello Linux`
2. 将标准输入中的文本，保存至一个文本文件（文件名`output.txt`），存放在当前工作目录下。

### 参考代码

参考代码1：

```bash
#!/bin/bash
echo "Hello Linux"
echo -n > output.txt #清空output.txt
while read line
do
    echo $line >> output.txt
done
```

参考代码2：

```sh
#!/bin/bash
echo "Hello Linux"
cat > output.txt
```

请大家思考代码2的工作原理（了解[cat命令](https://linux.die.net/man/1/cat)）。

### 如何测试你的脚本？

运行以下命令：

```
echo "When the world turns its back on you, you turn your back on the world.\nTimon(The Lion King)" | ./hello_linux.sh
```

运行后，如果代码正确，则屏幕显示：

```
Hello Linux
```

且output.txt文件内容为：（注,执行`cat output.txt`查看文件内容）

```
When the world turns its back on you, you turn your back on the world.
Timon(The Lion King)
```

## 参考资料

1. [Shell 教程](http://www.runoob.com/linux/linux-shell.html)
2. [学习bash shell](http://cn.linux.vbird.org/linux_basic/0320bash.php)
3. [bash基础（Linux入门公开课）](https://ftp.ustclug.org/course/)