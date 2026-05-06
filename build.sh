#!/bin/bash

rm -r _site
mkdir _site
cp index.html _site/

lastd=
DIRS=`find . -maxdepth 1 -type d -name "20[0-9][0-9]" | cut -d'/' -f2 | sort `
echo $DIRS

for d in $DIRS; do
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

