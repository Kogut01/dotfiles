#!/bin/bash
updates=$(checkupdates | wc -l)
aur_updates=$(yay -Quq --aur | wc -l)
total=$((updates + aur_updates))
if [ $total -gt 0 ]; then
    echo "$total 📦"
else
    echo "OK"
fi
