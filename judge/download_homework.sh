#!/bin/bash
BASEDIR=$(dirname "$0")
source $BASEDIR/common.sh
csv_file=$1
poj_name=$2
mkdir -p $poj_name
function hook_do_csv(){
    local target_dir=$poj_name/$stu_id
    [[ ! -d $target_dir ]] && git clone --depth=1 https://github.com/${github_id}/${poj_name}.git $target_dir
}
do_csv $csv_file
