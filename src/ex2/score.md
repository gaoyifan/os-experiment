# 评分规则

* 内核成功引导`init`进程 并正确打印启动时间（+3分），且：
  * 压缩后的内核`bzImage`镜像小于2MB（+1分）
  * 根文件系统小于4MB（+1分）
* 提交时间晚于截止日期（-2分）
* 抄袭（-5分）

最低分0分，最高分5分。若计分结果低于0分，则得分为0分。

## 附：抄袭定义与处罚

以下行为将被判抄袭：

1. 直接复制他人的git仓库
2. 提交非本人编译的二进制内核文件
3. 提交非本人生成的根文件系统
4. 提交的根文件系统中包含非本人编译的二进制程序

程序检测到抄袭的，将进行人工复核。确认抄袭的，本次作业记0分，并上报任课教师。

## 附：评测环境

CPU： x86_64，单核，2.60GHz

内存：16MB

运行时间：小于2秒