#!/bin/sh

YEAR=`date +"%Y/%B"`
if [[ -d $YEAR ]]; then
    echo "folder $YEAR exists"
    if [ -f "$YEAR/todo.txt" ]; then
        echo "Nothing Doing...."
        exit 1;
    fi 
# make folder every month
else
    mkdir -pv $YEAR; cd $YEAR
fi

# make a file
cal -m `date +%B` > todo.txt
while read -r line;
do
    echo $line >> todo.txt
done < "../../todo_template"

