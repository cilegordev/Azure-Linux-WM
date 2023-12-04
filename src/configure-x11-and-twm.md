# install cbl-mariner-2.0 via vmware 16.x
source : https://raw.githubusercontent.com/DrewNaylor/drewnaylor.github.io/master/pages/wip/install-and-configure-x11-and-twm_cbl-mariner.txt
##

0. add mariner-extended.repo (optional)
```bash
sudo cp CBL-Mariner-DE/src/mariner-extended.repo /etc/yum.repos.d/
```

1. install package first
```bash
sudo dnf -y install libX* xorg* mesa* xterm dejavu-sans-mono-fonts --skip-broken
```

2. xf86-video-fbdev-0.5.0
```bash
tar -xf xf86-video-fbdev-0.5.0.tar.gz
cd xf86-video-fbdev-0.5.0
chmod 755 configure
./configure
sudo make install
```

3. xf86-video-vmware-13.4.0
```bash
tar -xf xf86-video-vmware-13.4.0.tar.gz
cd xf86-video-vmware-13.4.0
chmod 755 configure
./configure
sudo make install
sudo depmod -a
sudo dracut --force
echo vmwgfx | sudo tee -a /etc/modules
sudo modprobe vmwgfx
```

4. twm-1.0.12
```bash
tar -xf twm-1.0.12.tar.gz
cd twm-1.0.12
sed -i -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' src/Makefile.in
chmod 755 configure
./configure
sudo make install
```

5. xinit-1.4.2
```bash
tar -xf xinit-1.4.2.tar.gz
cd xinit-1.4.2
chmod 755 configure
./configure
sudo make install
```

6. turn on startx
```bash
nano ~/.xinitrc
#!/bin/sh
exec twm
```

7. on twm
```bash
xrandr --output Virtual-1 --mode 1360x768
```