echo "username ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo apt update -y
echo "N" | sudo apt upgrade -y
sudo apt install nano dphys-swapfile -y
sudo sed -i 's/CONF_MAXSWAP=.*/CONF_MAXSWAP=4096/' /sbin/dphys-swapfile
sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=4096/; s/CONF_MAXSWAP=.*/CONF_MAXSWAP=4096/' /etc/dphys-swapfile
sudo sed -i '/^ubuntu.*stack/s/^/#/; /^#ubuntu.*stack/a ubuntu hard stack unlimited\nubuntu soft stack unlimited' /etc/security/limits.conf
sudo apt install python-pip -y
sudo -H pip install jetson-stats
sudo reboot
