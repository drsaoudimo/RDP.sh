#! /bin/bash
printf "Installing RDP Be Patience... " >&2
#{
#添加用户
sudo useradd -m N3LK
sudo adduser N3LK sudo
echo 'N3LK:0789' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
#安装谷歌远程桌面
apt-get update
apt install gdebi
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
apt gdebi chrome-remote-desktop_current_amd64.deb
apt install --assume-yes --fix-broken
#设置环境变量，非用户输入交互方式
DEBIAN_FRONTEND=noninteractive \

#安装xfce4桌面
apt install --assume-yes xfce4 desktop-base
apt install xfce4-terminal
apt remove gnome-terminal
bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
apt install --assume-yes xscreensaver
systemctl disable lightdm.service

#安装x window:
#sudo apt-get install xorg
#安装lxde:
#sudo apt-get install lxde-core
#sudo apt install --assume-yes xscreensaver
#sudo systemctl disable lightdm.service
#sudo apt install gdebi
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo gdebi google-chrome-stable_current_amd64.deb
#sudo apt install --assume-yes --fix-broken

#安装谷歌浏览器
apt gdebi  google-chrome-stable_current_amd64.deb
apt install --assume-yes --fix-broken
#安装文件管理器和文件编辑器
apt install nautilus nano -y 
#添加用户到远程桌面用户组
adduser N3LK chrome-remote-desktop
#安装网络命令支持
apt install net-tools # ifconfig
apt install iputils-ping # ping

#安装中文字体

printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - N3LK -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
