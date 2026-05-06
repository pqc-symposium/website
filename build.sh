#!/bin/bash

mkdir _site
cp index.html _site/

for d in 20* ; do
	if [ ! -d $d ]; then continue; fi
	cd $d
	
	bundle install
	bundle exec jekyll build
	cp -Rv _site ../_site/$d
	
	cd ..
done
