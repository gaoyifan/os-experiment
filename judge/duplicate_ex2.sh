#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))
EXP_NAME=os-experiment-2
DUP1=${BASEDIR}/${EXP_NAME}.dup1
DUP2=${BASEDIR}/${EXP_NAME}.dup2
cd ${EXP_NAME}
HOMEWORK_BASE=$(pwd)
for stu_id in * ; do
    [[ ! -d $HOMEWORK_BASE/$stu_id ]] && continue

    cd $HOMEWORK_BASE/$stu_id
    echo -n "$stu_id " >> $DUP1
    echo -n "$stu_id " >> $DUP2

    strings bzImage | grep -P '(CST|UTC)' | md5sum | awk '{print $1}' >> $DUP1
    zcat initramfs.gz | strings | grep BusyBox | grep -P '(CST|UTC)' | md5sum | awk '{print $1}' >> $DUP2

    echo >> $DUP1
    echo >> $DUP2
done

awk '{print $2}' $DUP1 | sort | uniq -c | sort -nk 1 > $DUP1.count
awk '{print $2}' $DUP2 | sort | uniq -c | sort -nk 1 > $DUP2.count

