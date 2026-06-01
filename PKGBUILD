# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=bluez
pkgname=('bluez' 'bluez-utils' 'bluez-libs' 'bluez-cups' 'bluez-mesh'
         'bluez-obex')
pkgver=5.86
pkgrel=3
pkgdesc='Userspace daemons, utils and libraries of Linux Bluetooth stack'
url="http://www.bluez.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only')
makedepends=('dbus' 'libical' 'alsa-lib' 'json-c' 'ell' 'python-docutils'
             'python-pygments' 'cups' 'autoconf' 'linux-headers' 'glib2'
             'readline')
source=(
  https://www.kernel.org/pub/linux/bluetooth/${pkgname}-${pkgver}.tar.xz
  bluetoothd.service
  0001-enable-dbus-without-systemd.patch
  0002-src-org.bluez.service-start-dinit-service.patch
  0003-allow-mesh-on-non-systemd-system.patch
  0004-grant-permission-to-bluetooth-group.patch
)
sha256sums=('99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d'
            '286cf9aa23d923023957f372e40b255889dc3fa3bb8075206548f6db805fa90b'
            '93fa6d201bb4546bb680f6d6f903ba5e767829ab275361323c14b0389fb6c803'
            '1a7e4c8b13ffc41304a06fa3d669cb6d252f0870c23c54fe84f5d861d5c964e1'
            '417ea301f980e0e9ff38083aa73b3ac4e011f930a3f3338fdeb3e80a585e8c1f'
            '8fb22853838ddf51774da01eb6a812ac4f03da99f792256c07d6fe2f715d5bdd')

prepare() {
  _patch_ "${pkgname}"-${pkgver}

  cd "${pkgname}"-${pkgver}

  # test-vcp fails: https://github.com/bluez/bluez/issues/683
  sed -e "s@unit_tests += unit/test-vcp@@" -i Makefile.am

  autoreconf -fiv

  # Remove vendored ell source to prevent header resolution errors
  rm -rf ell
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
          --disable-deprecated \
	  --enable-external-ell
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

  msg2 "Picking bluez"
  _pick_ bluez etc/bluetooth/main.conf
  _pick_ bluez etc/bluetooth/input.conf
  _pick_ bluez etc/bluetooth/network.conf
  _pick_ bluez usr/lib/bluetooth/bluetoothd
  _pick_ bluez usr/share/dbus-1/system-services/org.bluez.service
  _pick_ bluez usr/share/dbus-1/system.d/bluetooth.conf
  _pick_ bluez usr/share/man/man8/bluetoothd.8

  msg2 "Picking bluez-utils"
  install -Dm755 "$srcdir/bluez-$pkgver/tools/.libs/"{advtest,avinfo,avtest,bcmfw,bdaddr,bluemoon,bluetooth-player,bneptest,btattach,btconfig,btgatt-client,btgatt-server,btinfo,btiotest,btmgmt,btpclient,btpclientctl,btproxy,btsnoop,check-selftest,cltest,create-image,eddystone,gatt-service,hcieventmask,hcisecfilter,hex2hcd,hwdb,ibeacon,isotest,l2ping,l2test,mpris-proxy,nokfw,oobtest,rctest,rtlfw,scotest,seq2bseq,test-runner} \
     -t "$srcdir"/pkgs/bluez-utils/usr/bin
  rm usr/bin/{advtest,avinfo,avtest,bcmfw,bdaddr,bluemoon,bluetooth-player,bneptest,btattach,btconfig,btgatt-client,btgatt-server,btinfo,btiotest,btmgmt,btpclient,btpclientctl,btproxy,btsnoop,check-selftest,cltest,create-image,eddystone,gatt-service,hcieventmask,hcisecfilter,hex2hcd,hwdb,ibeacon,isotest,l2ping,l2test,mpris-proxy,nokfw,oobtest,rctest,rtlfw,scotest,seq2bseq,test-runner}
  _pick_ bluez-utils usr/bin/{bluetoothctl,btmon}
  _pick_ bluez-utils usr/share/man/man1/bluetoothctl*.1
  _pick_ bluez-utils usr/share/man/man1/{btattach,btmgmt,btmon,isotest,l2ping,rctest}.1
  _pick_ bluez-utils usr/share/man/man5/org.bluez.{A,B,C,D,G,I,L,M,N,P,T}*.5
  _pick_ bluez-utils usr/share/zsh/site-functions/_bluetoothctl

  msg2 "Picking bluez-libs"
  _pick_ bluez-libs usr/include/bluetooth/*
  _pick_ bluez-libs usr/lib/libbluetooth.so*
  _pick_ bluez-libs usr/lib/pkgconfig/*
  _pick_ bluez-libs usr/share/man/man7/{mgmt,sco,l2cap,hci,iso}.7


  msg2 "Picking bluez-cups"
  _pick_ bluez-cups usr/lib/cups/backend/bluetooth

  msg2 "Picking bluez-mesh"
  install -Dm755 "$srcdir/bluez-$pkgver/tools/.libs/"{mesh-cfgclient,mesh-cfgtest} \
    -t "$srcdir"/pkgs/bluez-mesh/usr/bin
  rm usr/bin/{mesh-cfgclient,mesh-cfgtest}
  _pick_ bluez-mesh etc/bluetooth/mesh-main.conf
  _pick_ bluez-mesh usr/lib/bluetooth/bluetooth-meshd
  _pick_ bluez-mesh usr/share/dbus-1/system-services/org.bluez.mesh.service
  _pick_ bluez-mesh usr/share/dbus-1/system.d/bluetooth-mesh.conf
  _pick_ bluez-mesh usr/share/man/man8/bluetooth-meshd.8

  msg2 "Picking bluez-obex"
  install -Dm755 "$srcdir/bluez-$pkgver/tools/.libs/"{obexctl,obex-client-tool,obex-server-tool} \
    -t "$srcdir"/pkgs/bluez-obex/usr/bin
  rm usr/bin/{obexctl,obex-client-tool,obex-server-tool}
  _pick_ bluez-obex usr/lib/bluetooth/obexd
  _pick_ bluez-obex usr/share/dbus-1/services/org.bluez.obex.service
  _pick_ bluez-obex usr/share/man/man5/org.bluez.obex*.5
  _pick_ bluez-obex usr/share/dbus-1/system.d/obex.conf
}

# Case "test-vcp" is flaky. Some tests may depend on certain kernel features
# to run.
# https://github.com/bluez/bluez/issues/683
# Let's disable it for now
# check() {
#   cd "$pkgname"-$pkgver
#   make check
# }

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
