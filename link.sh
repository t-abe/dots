#! /bin/zsh
for filename in `find dots/.* | perl -ne '/^dots\/\.[\w.]+$/ || next; print'`
do
    echo $filename
    ln -s $filename
done
