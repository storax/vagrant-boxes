#!/bin/bash -eux

# Clean up
apt-get -y --purge remove linux-headers-$(uname -r)
apt-get -y --purge autoremove
apt-get -y purge $(dpkg --list |grep '^rc' |awk '{print $2}')
apt-get -y purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{ print $2}')
apt-get -y clean

# delete linux source
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge

# delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf

# delete oddities
apt-get -y purge popularity-contest

# Cleanup Virtualbox
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

# Remove unused locales
rm -rf /usr/share/locale/{af,am,ar,as,ast,az,bal,be,bg,bn,bn_IN,br,bs,byn,ca,cr,cs,csb,cy,da,de_AT,dz,el,en_AU,en_CA,eo,es,et,et_EE,eu,fa,fi,fo,fr,fur,ga,gez,gl,gu,haw,he,hi,hr,hu,hy,id,is,it,ja,ka,kk,km,kn,ko,kok,ku,ky,lg,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,nb,ne,nl,nn,no,nso,oc,or,pa,pl,ps,pt,pt_BR,qu,ro,ru,rw,si,sk,sl,so,sq,sr,sr*latin,sv,sw,ta,te,th,ti,tig,tk,tl,tr,tt,ur,urd,ve,vi,wa,wal,wo,xh,zh,zh_HK,zh_CN,zh_TW,zu}

# Remove docs
rm -rf /usr/share/doc

# Remove files from cache
find /var/cache -type f -delete -print

# Remove guest addition source
rm -rf /usr/src/virtualbox-ose-guest*
rm -rf /usr/src/vboxguest*

# Remove history file
unset HISTFILE