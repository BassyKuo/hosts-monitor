#!/bin/sh
printf "%s\t%s\t%s\n" "aaa" "tb b b" "ccc" | column -t -s'\t' | awk '{print "   "$0}'
TAB=`echo "\t"`
format="%s\t%s\t%s\n"
( \
printf $format "-t,--time,time [TIME]" "list specific date record" "[TIME]={today,yesterday,...}"
printf $format "-s,--service,service [SERVICE]" "list specific service record" "[SERVICE]={sshd,hosts-monitor}"
printf $format "-e,--event,event [EVENT]" "list specific event record" "[EVENT]={Invalid-User,Failed-Password,Manual}"
printf $format "-u,--user,--id,user,id [USERID]" "list specific login userid record" "[USERID]={admin,test,root,...}"
printf $format "-i,--ip,ip [IP]" "list specific login ip record" "[IP]=xxx.xxx.xxx.xxx"
printf $format "-S,--status,status [STATUS]" "list specific ban/unban record" "[STATUS]={ban,unban}"
printf $format "-a,--all,all" "list all record"
printf $format "PATTERN" "search lines matching the pattern in regular expression" "ex: 'Ban', '^2018.*root', '\\(root\\|admin\\|user\\)'"
) | column -t -s"$TAB" | awk '{print "   "$0}'
