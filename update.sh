#!/bin/bash  

snaps=(/timeshift/snapshots/*)

if [[ ${snaps[0]} -ot ${snaps[1]} ]]
then
 sudo rm -fr $snaps && echo "$snaps has been deleted."
 echo "Remaining snapshot:" && ls /timeshift/snapshots
 if sudo timeshift --create --comments "weekly update"
 then
   sudo pacman -Syu
 fi  
else
 echo "Something went wrong..."
fi
