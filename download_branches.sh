#!/bin/bash
echo Input the base url of git repo:
read url
echo Input the repo name:
read repo
echo Input the branches you want to download \(seperated by space\):
read list
echo

count=0

mkdir $repo
for i in ${list[@]}
do
	curl --get -b "_gitlab_session=***" -o $repo/$repo-$i.zip $url\/repository\/archive.zip?ref=$i
	echo Downloaded branch for $i.
  count=`expr $count + 1`
done

echo ::$count branches downloaded.
