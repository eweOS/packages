# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=bluez
pkgname=('bluez' 'bluez-utils' 'bluez-libs' 'bluez-cups' 'bluez-mesh' 'bluez-obex')
pkgver=5.77
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL-2.0-only')
makedepends=('dbus' 'libical' 'alsa-lib' 'json-c' 'ell' 'python-docutils' 'python-pygments' 'cups' 'autoconf' 'linux-headers')
source=(
  https://www.kernel.org/pub/linux/bluetooth/${pkgname}-${pkgver}.tar.xz
  bluetoothd.service
  basename.patch
  0001-enable-dbus-without-systemd.patch
  0001-src-org.bluez.service-start-dinit-service.patch
  0002-allow-obexd-on-non-systemd-system.patch
  0003-allow-mesh-on-non-systemd-system.patch
  0008-grant-permission-to-bluetooth-group.patch
)
sha256sums=('5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812'
            'ea87de0d8182404d7ef7139ebc6bb2e8d57224f9b8dfae3e438f95308277c801'
            'd67c84fca3ba42fd1c67ce3605b0cbedde200ccef5e961975f4501887a724dec'
            '512e60ff0ceebb3e6db75b7284c2aaf52ae637077a607f693382be0471b42248'
            '1a7e4c8b13ffc41304a06fa3d669cb6d252f0870c23c54fe84f5d861d5c964e1'
            '92f033e0e2f53cf4220bd26bbd52ad498144064a38f322c59fa4b0a3cdc2e3a4'
            '417ea301f980e0e9ff38083aa73b3ac4e011f930a3f3338fdeb3e80a585e8c1f'
            '8fb22853838ddf51774da01eb6a812ac4f03da99f792256c07d6fe2f715d5bdd')

prepare() {
  _patch_ "${pkgname}"-${pkgver}
  cd "${pkgname}"-${pkgver}
  autoreconf -fiv
}

build() {
  cd "${pkgname}"-${pkgver}
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --enable-btpclient \
          --enable-midi \
          --enable-mesh \
          --enable-experimental \
          --enable-datafiles \
          --enable-library \
          --disable-udev \
          --disable-systemd \
          --disable-deprecated
  make

  # fake installation to be seperated into packages
  make DESTDIR="${srcdir}/fakeinstall" install
  
  # permission error
  chmod 777 ${srcdir}/fakeinstall/etc/bluetooth

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 "${srcdir}"/"${pkgbase}"-${pkgver}/tools/$filename "${srcdir}/fakeinstall"/usr/bin/$filename
  done
  
  cd ${srcdir}/fakeinstall
  
  _pick_ bluez etc/bluetooth/main.conf
  _pick_ bluez etc/bluetooth/input.conf
  _pick_ bluez etc/bluetooth/network.conf
  _pick_ bluez usr/lib/bluetooth/bluetoothd
  _pick_ bluez usr/share/dbus-1/system-services/org.bluez.service
  _pick_ bluez usr/share/dbus-1/system.d/bluetooth.conf
  _pick_ bluez usr/share/man/man8/bluetoothd.8
  
  _pick_ bluez-utils usr/bin/{advtest,amptest,avinfo,avtest,bcmfw,bdaddr,bluemoon,bluetoothctl,bluetooth-player,bneptest,btattach,btconfig,btgatt-client,btgatt-server,btinfo,btiotest,btmgmt,btmon,btpclient,btpclientctl,btproxy,btsnoop,check-selftest,cltest,create-image,eddystone,gatt-service,hcieventmask,hcisecfilter,hex2hcd,hwdb,ibeacon,isotest,l2ping,l2test,mcaptest,mpris-proxy,nokfw,oobtest,rctest,rtlfw,scotest,seq2bseq,test-runner}
  _pick_ bluez-utils usr/share/man/man1/bluetoothctl*.1
  _pick_ bluez-utils usr/share/man/man1/{btattach,btmgmt,btmon,isotest,l2ping,rctest}.1
  _pick_ bluez-utils usr/share/man/man5/org.bluez.{A,B,D,G,I,L,M,N,P}*.5
  _pick_ bluez-utils usr/share/man/man7/l2cap.7
  _pick_ bluez-utils usr/share/zsh/site-functions/_bluetoothctl
  
  _pick_ bluez-libs usr/include/bluetooth/*
  _pick_ bluez-libs usr/lib/libbluetooth.so*
  _pick_ bluez-libs usr/lib/pkgconfig/*
  
  _pick_ bluez-cups usr/lib/cups/backend/bluetooth
  
  _pick_ bluez-mesh etc/bluetooth/mesh-main.conf
  _pick_ bluez-mesh usr/bin/{mesh-cfgclient,mesh-cfgtest}
  _pick_ bluez-mesh usr/lib/bluetooth/bluetooth-meshd
  _pick_ bluez-mesh usr/share/dbus-1/system-services/org.bluez.mesh.service
  _pick_ bluez-mesh usr/share/dbus-1/system.d/bluetooth-mesh.conf
  _pick_ bluez-mesh usr/share/man/man8/bluetooth-meshd.8
  
  _pick_ bluez-obex usr/bin/{obexctl,obex-client-tool,obex-server-tool}
  _pick_ bluez-obex usr/lib/bluetooth/obexd
  _pick_ bluez-obex usr/share/dbus-1/services/org.bluez.obex.service
  _pick_ bluez-obex usr/share/man/man5/org.bluez.obex*.5  
}

check() {
  cd "$pkgname"-$pkgver
  # fails test-vcp due to lto - https://github.com/bluez/bluez/issues/683
  make check || /bin/true
}


package_bluez() {
  pkgdesc="Daemons for the bluetooth protocol stack"
  depends=('dbus' 'glib2' 'alsa-lib')
  backup=(etc/bluetooth/{main,input,network}.conf)

  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/

  # bluetooth.service wants ConfigurationDirectoryMode=0555
  chmod -v 555 "${pkgdir}"/etc/bluetooth
  
  _dinit_install_services_ $srcdir/bluetoothd.service

  # add basic documention
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis
  cp -a "${pkgbase}"-${pkgver}/doc/*.txt "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis/
}

package_bluez-utils() {
  pkgdesc="Development and debugging utilities for the bluetooth protocol stack"
  depends=('dbus' 'glib2' 'readline')
  optdepends=('ell: for btpclient')
  
  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/
}

package_bluez-libs() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack"
  provides=('libbluetooth.so')
  license=('LGPL-2.1-only')
  
  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/
}

package_bluez-cups() {
  pkgdesc="CUPS printer backend for Bluetooth printers"
  depends=('cups' 'glib2' 'dbus')
  
  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/
}

package_bluez-mesh() {
  pkgdesc="Services for bluetooth mesh"
  depends=('json-c' 'readline')
  backup=('etc/bluetooth/mesh-main.conf')
  
  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/

  # bluetooth.service wants ConfigurationDirectoryMode=0555
  chmod -v 555 "${pkgdir}"/etc/bluetooth
}

package_bluez-obex() {
  pkgdesc="Object Exchange daemon for sharing content"
  depends=('glib2' 'libical' 'dbus' 'readline')
  
  cp -r $srcdir/pkgs/$pkgname/* $pkgdir/

  # make sure there are no files left to install
  rm fakeinstall/usr/lib/libbluetooth.a
  rm fakeinstall/usr/share/man/man7/rfcomm.7
  find fakeinstall -depth -print0 | xargs -0 rmdir
}
