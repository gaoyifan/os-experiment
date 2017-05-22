# 漏洞介绍

本实验选取了3个不同类型的漏洞，大家可以根据自身情况选择。

## CVE-2017-6074

DCCP模块中的一个double free类型的漏洞。

### 参考资料

1. [kernel commit](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5edabca9d4cff7f1f2b68f0bac55ef99d9798ba4)
2. [CVE-2017-6074: DCCP double-free vulnerability (local root)](http://www.openwall.com/lists/oss-security/2017/02/22/3)
3. [POC](https://github.com/xairy/kernel-exploits/tree/master/CVE-2017-6074)
4. [Double Free浅析](http://wps2015.org/drops/drops/Double%20Free浅析.html)
5. [缓冲区溢出——堆溢出](http://staff.ustc.edu.cn/~sycheng/ssat/ch04a_Heap_Overflow.pdf)
6. [Linux 堆溢出漏洞利用之 unlink](https://segmentfault.com/a/1190000005655132)

## CVE-2017-2636

N_HLDC驱动在竞态条件下存在的一个double free类型漏洞。

### 参考资料

1. [kernel commit](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=be10eb7589337e5defbe214dae038a53dd21add8)
2. [CVE-2017-2636: exploit the race condition in the n_hdlc Linux kernel driver bypassing SMEP](https://a13xp0p0v.github.io/2017/03/24/CVE-2017-2636.html)
3. [CVE-2017-2636: local privilege escalation flaw in n_hdlc](http://www.openwall.com/lists/oss-security/2017/03/07/6)
4. [Double Free浅析](http://wps2015.org/drops/drops/Double%20Free浅析.html)
5. [缓冲区溢出——堆溢出](http://staff.ustc.edu.cn/~sycheng/ssat/ch04a_Heap_Overflow.pdf)
6. [Linux 堆溢出漏洞利用之 unlink](https://segmentfault.com/a/1190000005655132)
7. [Race Condition](https://en.wikipedia.org/wiki/Race_condition)

## CVE-2016-5195

内存子系统在竞态条件下执行写时复制时存在漏洞，致使普通用户可获得其他用户只读内存映射的写入权限。

### 参考资料

1. [kernel commit](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619)
2. [CVE-2016-5195 "Dirty COW" Linux kernel privilege escalation vulnerability](http://www.openwall.com/lists/oss-security/2016/10/21/1)
3. [dirtycow.ninja](https://dirtycow.ninja)
4. [POCs](https://github.com/dirtycow/dirtycow.github.io/wiki/PoCs)
5. [写时复制](https://zh.wikipedia.org/zh-cn/寫入時複製)

