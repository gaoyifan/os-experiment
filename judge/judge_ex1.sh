#!/bin/bash
source common.sh
BASEDIR=$(dirname $(readlink -f $0))
EXP_NAME=os-experiment-1
SCORE=${BASEDIR}/${EXP_NAME}.score
cd ${EXP_NAME}
HOMEWORK_BASE=$(pwd)
echo -e 'px3UuuodTSQx5Fcc\nLE0IHrK8p' > teststring
for stu_id in * ; do
    [[ ! -d $HOMEWORK_BASE/$stu_id ]] && continue

    cd $HOMEWORK_BASE/$stu_id
    add_score $stu_id
	add_score $(git rev-parse HEAD)

    #1 repo existance
    add_score 1

    #2 script existance
    if [[ -f hello_linux.sh ]]; then
        add_score 1
    else
        add_score 0
    fi

    #3 script executable
    if [[ -x hello_linux.sh ]]; then
        add_score 1
    else
        add_score 0
    fi

    #4 line break
    if [[ ! -f hello_linux.sh ]] || grep -q -U $'\015' hello_linux.sh > /dev/null ; then
        add_score 0
    else
        add_score 1
    fi

    #5 run
    docker rm -f judge
    cat $HOMEWORK_BASE/teststring | docker run -i --name=judge -v $(pwd):/opt --workdir=/opt ubuntu:16.04 bash /opt/hello_linux.sh > stdout.txt &
    sleep 2
    if grep -q '^Hello Linux$' stdout.txt; then
        if cmp --silent $HOMEWORK_BASE/teststring output.txt; then
            add_score 1;
        else
            add_score 0;
        fi
    else
        add_score 0;
    fi

    #late commit
    if [[ $LATE_COMMIT == "true" ]]; then
        add_score -2
    else
        add_score 0
    fi

    echo >> $SCORE
done
