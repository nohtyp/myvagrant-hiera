#!/bin/bash

#Used examples in the following link:
#http://coldattic.info/shvedsky/pro/blogs/a-foo-walks-into-a-bar/posts/7
#awk $0 is the entire line -> $1 is first argument -> line is making entire line equal first arg.
#will provision machines concurrently in vagrant

NUMPROCS='2'
 
vagrant up --no-provision;vagrant status |grep 'virtualbox' |awk '$0=$1'| xargs --max-procs=$NUMPROCS -I HOST vagrant provision HOST
