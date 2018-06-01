#for every file in the chosen directory
for f in $(find /home/cavaz/prova -type f -name '*.cryptokitty'); do
echo $f
#i decrypt the files with extension .criptokitty and i use the key "pippo", then i remove the crypted files leaving only the clear text ones
[ -f $f ] && openssl enc -d -aes-256-cbc -in $f -k pippo -out ${f%.cryptokitty} ; rm $f

done

