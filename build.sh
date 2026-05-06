#!/bin/bash

mkdir _site
cp index.html _site/

lastd=
for d in `ls 20* | sort`; do
	if [ ! -d $d ]; then continue; fi
	cd $d
	echo "============= $d ==================="
	lastd=$d
	
	echo "=== bundle install"
	bundle install
	echo "=== bundle exec"
	bundle exec jekyll build
	echo "=== copy"
	cp -Rv _site ../_site/$d
	
	echo "============= $d done ==================="
	cd ..
done

if [ "$lastd" != "" ]; then
  cp -Rv _site/$lastd/* _site/
fi

