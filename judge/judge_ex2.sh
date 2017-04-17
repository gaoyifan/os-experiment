#!/bin/bash
source common.sh
BASEDIR=$(dirname $(readlink -f $0))
EXP_NAME=os-experiment-2
SCORE=${BASEDIR}/${EXP_NAME}.score
cd ${EXP_NAME}
HOMEWORK_BASE=$(pwd)
docker rm -f judge
for stu_id in * ; do
    [[ ! -d $HOMEWORK_BASE/$stu_id ]] && continue

    cd $HOMEWORK_BASE/$stu_id
    add_score $stu_id
	add_score $(git rev-parse HEAD)

    docker run -i --name=judge -v `pwd`:/opt -w /opt qemu qemu-system-x86_64 -m 32M -kernel bzImage -initrd initramfs.gz -nographic -append "console=ttyS0" > stdout.txt &
    sleep 3
    docker rm -f judge
    if grep -P -i -q '^Boot took [0-9.]+ seconds.*$' stdout.txt; then
        add_score 3
        if (( `stat -c%s bzImage` < 2097152 )); then
            add_score 1
        else
            add_score 0
        fi
        if (( `stat -c%s initramfs.gz` < 4194304 )); then
            add_score 1
        else
            add_score 0
        fi
    else
        add_score 0
        add_score 0
        add_score 0
    fi
    add_score 0 #late
    echo >> $SCORE
done
