#!/bin/sh
# (c) 2013, GPLv3

BOINC_CFG=/var/lib/boinc/global_prefs_override.xml
BOINC_PASS_FILE=/var/lib/boinc/gui_rpc_auth.cfg
BOINC_TMP=/tmp/change.xml

function check_limit()
{
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Not a number: $1 Invalid percentage. Must be in range 0 - 100."
        return 1
    fi
    if [[ $1 -lt 0 || $1 -gt 100 ]]
    then
        echo "Invalid percentage: $1. Must be in range 0 - 100."
        return 1
    fi

    return 0
}

function update_cfg()
{
    cp $BOINC_CFG $BOINC_TMP
    sed -i -e "s/<max_ncpus_pct>.*<\/max_ncpus_pct>/<max_ncpus_pct>${1}<\/max_ncpus_pct>/g" $BOINC_TMP
    cp $BOINC_TMP $BOINC_CFG
    rm $BOINC_TMP
}

if [[ $# -lt 1 ]]
then
    echo "CPU count percentage not specified!"
    echo "Usage: ${0} N"
    echo "N - percentage of CPU cores to use (0-100)"
    exit 1
fi

CPUPERC=$1

check_limit $CPUPERC || exit 1
update_cfg $CPUPERC
pass=`cat ${BOINC_PASS_FILE}`
boinccmd --host localhost --passwd $pass --read_global_prefs_override
