#!/bin/bash
echo Do you want to delete the following branches?

git branch --column | grep -v 'master'
echo ......

select yn in "yes" "no";
do
	case $yn in
		yes ) break;;
		no ) exit;;
	esac
done

list=$(git branch | grep -v 'master')

git checkout master

count=0

for i in ${list[@]}
do
	git branch -D ${i}
	count=`expr $count + 1`
done

echo ::$count branches deleted.
