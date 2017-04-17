#!/bin/bash
source common.sh
source common_mail.sh

BASEDIR=$(dirname $(readlink -f $0))
EXP_NAME=os-experiment-2
SCORE=${BASEDIR}/${EXP_NAME}.score
function hook_do_csv(){
(
cat << EOF
${name}同学：

你好！

EOF


if grep -q $stu_id $SCORE; then
    grep $stu_id $SCORE | (
        unset sum commit_id q1 q2 q3 m1
        read stu_id2 commit_id q1 q2 q3 m1
        sum=$((q1+q2+q3+m1))
        cat << EOF
已收到你的第二次实验作业，Git提交ID为：$commit_id

第一次评测成绩如下：
  1.正确打印启动时间...+${q1}分
  2.内核镜像小于2MB...+${q2}分
  3.根文件系统小于4MB...+${q3}分
  4.逾期（扣分）...${m1}分
总分： ${sum}分 （注：满分5分）

下次评测时间定于：2017年4月22日 23:00

第二次实验作业最终分数取两次评测较高分。

EOF
    )
else
    cat << EOF
未收到第二次实验作业，请联系助教。
EOF
fi

cat << EOF
如有任何疑问，请回复本邮件。

--
Yifan Gao(高一凡)
Mobile: 15555117121
PGP ID: 99E74594F5D8CAAD
EOF
) | send_mail $email "操作系统第二次实验作业成绩（第一次评测）"
}

do_csv student_list.csv
