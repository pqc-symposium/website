#!/bin/bash

mkdir _site
cp index.html _site/

for d in 20* ; do
	if [ ! -d $d ]; then continue; fi
	cd $d
	echo "============= $d ==================="
	
	echo "=== bundle install"
	bundle install
	echo "=== bundle exec"
	bundle exec jekyll build
	echo "=== copy"
	cp -Rv _site ../_site/$d
	
	echo "============= $d done ==================="
	cd ..
done
