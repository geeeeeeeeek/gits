echo Do you want to push the following branches?

git branch --column | grep -v 'master'
echo ......

select yn in "yes" "no";
do
	case $yn in
		yes ) break;;
		no ) exit;;
	esac
done

count=0
all=0
list=$(git branch | grep -v 'master')

for i in ${list[@]}
do
	all=`expr $all + 1`
done

for i in ${list[@]}
do
	git checkout ${i}
	git push origin ${i}
	count=`expr $count + 1`
	progress=`expr $count \* 100 / $all`
	echo [ ${progress} %]Pushed branch for ${i}.
done

git checkout master

echo ::$all branches pushed.
