#!/bin/sh
# Based off of the ebuild from https://gitweb.gentoo.org/repo/gentoo.git/plain/games-action/battalion/battalion-1.4b-r1.ebuild, so \
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


PN=battalion
PV=1.4b
PE=.tar.bz2
SRC_URI="https://www.evl.uic.edu/aej/BATTALION/${PN}${PV}${PE}"
PATCH_URI="https://gitweb.gentoo.org/repo/gentoo.git/plain/games-action/battalion/files/battalion-1.4b-fix-build-system.patch https://gitweb.gentoo.org/repo/gentoo.git/plain/games-action/battalion/files/battalion-1.4b-warning.patch"

download_src() {
	curl -s -O "${SRC_URI}"
	tar xfj ${PN}${PV}.tar.bz2
	cd ${PN}${PV}

	for p in ${PATCH_URI}; do
                curl -s -O "$p"
        done

	cd ..
}

patch_src() {
	patch -p1 < battalion-1.4b-fix-build-system.patch
	patch -p1 < battalion-1.4b-warning.patch

	sed -i \
                -e "s:SOUNDS/:/usr/share/${PN}/SOUNDS/:" \
                -e "s:MUSIC/:/usr/share/${PN}/MUSIC:" \
                audio.c
	sed -i \
                -e "s:DATA/:/usr/share/${PN}/TEXTURES/:" \
               	-e "s:/usr/tmp:/var/${PN}:" \
                battalion.c
	sed -i \
                -e "s:TEXTURES/:/usr/share/${PN}/TEXTURES/:" \
               	graphics.c

	sed -i \
		-e "s:TEXTURES/:

	rm SOUNDS/*.au
	rm MUSIC/*.au
}

build_src() {
	make clean 2>/dev/null
	make -j$(nproc)
}

install_src() {
	install -d /usr/share/${PN}/
	
	#install -m 644 DATA MUSIC SOUNDS TEXTURES /usr/share/${PN}/
	USR_DIRS="DATA MUSIC SOUNDS TEXTURES"
	for d in ${USR_DIRS}; do
		install -d /usr/share/${PN}/${d}/
		install -m 644 ${d}/* /usr/share/${PN}/${d}/
	done

	install -d /usr/local/bin/
	install -m 755 battalion /usr/local/bin/

	mkdir -p /var/${PN}
	touch /var/${PN}/battalion_hiscore
	chmod 660 /var/${PN}/battalion_hiscore
}

rm_src() {
rm -r ${PN}${PV} ${PN}${PV}${PE} 
}

uninstall_src() {
: # add uninstall option
}

while getopts "hdpbiru" opt; do
	case "$opt" in
	h) # make help like battalion's ***
		echo "-b) build source"
		echo "-d) download source and extract for build"
		echo "-p) patch source"
		echo "-i) install source"
		echo "-r) remove source"
		echo "-u) uninstall source"
		exit 0
		;;
	d) download_src
		;;
	p) cd ${PN}${PV}; patch_src; cd ..
		;;
	b) cd ${PN}${PV}; build_src; cd ..
		;;
	i) cd ${PN}${PV}; install_src; cd ..
		;;
	r) rm_src
		;;
	u) uninstall_src
		;;
	# add if statement to cd if in all except h
	esac
done
