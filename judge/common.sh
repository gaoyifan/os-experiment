#!/bin/bash
function do_csv(){
    local csv_file=$1
    local OLDIFS=$IFS
    IFS=","
    tail -n +2 $csv_file | tr -d '\r' | while read name stu_id github_id email
    do
        export name=$(eval echo $name)
        export stu_id=$(eval echo $stu_id)
        export github_id=$(eval echo $github_id)
        export email=$(eval echo $email)
        IFS=$OLDIFS
        hook_do_csv
        IFS=","
    done
    IFS=$OLDIFS
}

function add_score(){
    echo -n "$1 " >> $SCORE
}
