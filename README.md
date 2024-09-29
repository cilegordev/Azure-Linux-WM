# Azure Linux WM
To many choices on the internet so I chose dwm

# Preview
| DWM on Azure Linux 3.0 |
|-|
| ![](image/dwm.png) |
| <div align="center"> - </div> |

other screenshot : [image1](image/preview-dwm.png) - [image2](image/preview-kernel-6.11.0.png) - [image3](image/preview-plymounth.png) - [image4](image/ms-edge-on-azurelinux.png)

# To Do
> Installing on bare metal later

# How To Install
```zsh
wget https://gist.githubusercontent.com/cilegordev/18c4a83e55c9f4ff456b6c0a9658d617/raw/4efb0238da63e20049803aa80f38e6b33c085e49/dwm-src-azl3.sh && chmod +x dwm-src-azl3.sh && ./dwm-src-azl3.sh
```
<details>
  <summary>
<h2>pre-installed : </h2>
</summary>
  
- dwm-6.5
- dmenu-5.3
- st-0.9.2
- slstatus-1.0
- feh-3.10.3
- compton-1.0
- plymouth-24.004.60
- nano-8.2
- thunar-4.19.3
- mousepad-0.6.2
- ristretto-0.13.2
- parole-4.18.1
- NetworkManager-1.51.1
- neofetch-7.1.1
- microsoft-edge-stable-129.0.2792.65
</details>

# How To Apply Plymounth
```zsh
sudo nano /etc/deafault/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_DISABLE_OS_PROBER=false
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo plymouth-set-default-theme azure --rebuild-initrd
```
