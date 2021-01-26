#!/usr/bin/bash

OPT=3

g++ -o cpptree  tree.cpp -O$OPT
gcc -o ctree tree.c -O$OPT 
rustc -o rstree -C opt-level=$OPT tree.rs 2> /dev/null
ocamlc -o mltree tree.ml -ccopt -O$OPT
go build -o gotree tree.go


for ext in c cpp rs ml go
do
    echo "######################"
    time ./${ext}tree
    echo "#########" $ext "#########"
    echo "######################"
done


arr=(tree.{c,cpp,rs,ml,go,sh})
for file in *; do
    if [[ ! ${arr[@]} =~ $file ]]; then
        rm $file
    fi
done

