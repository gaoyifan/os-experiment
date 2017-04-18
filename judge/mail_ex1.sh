#!/bin/bash
source common.sh
source common_mail.sh

BASEDIR=$(dirname $(readlink -f $0))
EXP_NAME=os-experiment-1
SCORE=${BASEDIR}/${EXP_NAME}.score
function hook_do_csv(){
(
cat << EOF
${name}同学：

你好！

EOF


if grep -q $stu_id $SCORE; then
    grep $stu_id $SCORE | (
        unset sum commit_id q1 q2 q3 q4 q5 m1
        read stu_id2 commit_id q1 q2 q3 q4 q5 m1
        sum=$((q1+q2+q3+q4+q5+m1))
        cat << EOF
已收到你的第一次实验作业，Git提交ID为：$commit_id

成绩如下：
  1.存在GitHub仓库...+${q1}分
  2.存在hello_linux.sh文件...+${q2}分
  3.hello_linux.sh是可执行文件...+${q3}分
  4.hello_linux.sh文件使用了Linux/UNIX风格的换行符...+${q4}分
  5.hello_linux.sh脚本执行结果正确...+${q5}分
  6.逾期（扣分）...${m1}分
总分： ${sum}分 （注：满分5分）

EOF
    )
else
    cat << EOF
未收到第一次实验作业，请联系助教。
EOF
fi

cat << EOF
如有任何疑问请回复本邮件。

--
Yifan Gao(高一凡)
Mobile: 15555117121
PGP ID: 99E74594F5D8CAAD
EOF
) | send_mail $email "操作系统第一次实验作业成绩"
}

do_csv student_list.csv
