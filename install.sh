#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# sshc v1.0 [SSH Management Console]

function check {
if [ "`whoami`" != "root" ]; then
        echo -e '[-] Please use root user or sudo'
        exit 1
fi
}

function install {
check
cp sshc /usr/bin/sshc
mkdir /etc/sshc
cp sshc.database /etc/sshc
chown root:root /etc/sshc/sshc.database
chmod 700 /etc/sshc/sshc.database
echo -e "Warning: Edit /etc/sshc/sshc.database and put your server informations."
echo -e "Done"
}

function uninstall {
check
echo -en "Warning: Do you want to continue ? (press enter to continue or ctrl+c for exit)" ; read
rm -f /etc/sshc/sshc.database
rm -rf /etc/sshc/
rm -f /usr/bin/sshc
echo -e "Done"

}

function usage {
echo "Usage: "
echo "	sudo ./install -i [for install program]"
echo "	sudo ./install -u [for uninstall program]"
}

case $1 in
	-i) install ;;
	-u) uninstall ;;
	*) usage ;;
esac
