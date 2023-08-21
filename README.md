# Jetsonnano-yolov5
This is a summary of how to set up the YOLOv5 environment on Jetson Nano.

# Requirement

* CUDA Version 10.2
* Python 3.6.9
* Jetpack
```
cat /etc/nv_tegra_release
# R32 (release), REVISION: 7.4, GCID: 33514132, BOARD: t210ref, EABI: aarch64, DATE: Fri Jun  9 04:25:08 UTC 2023
```
 
# Usage

```
sudo ./presetting.sh
```

```
sudo ./module_setting.sh
```

```
cd yolov5
sudo python3 detect.py
sudo python3 train.py
```

# Note
presetting.sh

```presetting.sh

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
```

module_setting.sh
 
```module_setting.sh
wget https://github.com/Qengineering/Install-OpenCV-Jetson-Nano/raw/main/OpenCV-4-5-5.sh
sudo chmod 755 ./OpenCV-4-5-5.sh
./OpenCV-4-5-5.sh

sudo apt-get install python3-pip libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev -y

sudo -H pip3 install future==0.18.3 wheel==0.37.1 mock==5.0.2 pillow==8.4.0 testresources==2.0.1 
sudo -H pip3 install --upgrade setuptools==59.6.0
sudo -H pip3 install Cython==0.29.36
sudo -H pip3 install gdown
gdown https://drive.google.com/uc?id=1wzIDZEJ9oo62_H2oL7fYTp5_-NffCXzt
sudo -H pip3 install torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch64.whl
sudo rm -rf torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch64.whl
git clone https://github.com/ultralytics/yolov5.git -b v6.0
cd yolov5
sed -i 's/^/# /' requirements.txt
sudo -H pip3 install Pillow>=7.1.2 requests>=2.23.0 torchvision>=0.8.1
sudo -H pip3 install seaborn
gdown https://drive.google.com/uc?id=1Q2NKBs2mqkk5puFmOX_pF40yp7t-eZ32
sudo -H pip3 install torchvision-0.10.0a0+300a8a4-cp36-cp36m-linux_aarch64.whl
sudo -H pip3 install tensorboard
sudo -H pip3 install pyyaml --upgrade
```
