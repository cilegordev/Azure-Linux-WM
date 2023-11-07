source : https://raw.githubusercontent.com/DrewNaylor/drewnaylor.github.io/master/pages/wip/install-and-configure-x11-and-twm_cbl-mariner.txt

add mariner-extended.repo (optional)

install cbl-mariner-2.0 via vmware 16.x

sudo dnf -y install libX* xorg* mesa* xterm dejavu-sans-mono-fonts --skip-broken

xf86-video-fbdev-0.5.0
	cd xf86-video-fbdev-0.5.0
	chmod 755 configure
	./configure
	sudo make install

xf86-video-vmware-13.4.0
	cd xf86-video-vmware-13.4.0
	chmod 755 configure
	./configure
	sudo make install
	sudo depmod -a
	sudo dracut --force
	echo vmwgfx | sudo tee -a /etc/modules
	sudo modprobe vmwgfx

twm-1.0.12
	cd twm-1.0.12
	sed -i -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' src/Makefile.in
	chmod 755 configure
	./configure
	sudo make install

xinit-1.4.2
	cd xinit-1.4.2
	chmod 755 configure
	./configure
	sudo make install

turn on startx
	nano ~/.xinitrc
		#!/bin/sh
		exec twm

on twm
	xrandr --output Virtual-1 --mode 1360x768