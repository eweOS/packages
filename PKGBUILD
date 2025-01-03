# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=lvm2
pkgname=('lvm2' 'device-mapper')
pkgver=2.03.29
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://sourceware.org/lvm2/'
license=('GPL2' 'LGPL2.1')
makedepends=('git' 'libaio' 'linux-headers')
source=("git+https://sourceware.org/git/lvm2.git#tag=v${pkgver//./_}" fix-stdio-usage.patch)
sha256sums=('57eb059aa5bffc086c79311271080fbcd376fa1ffadad087cd77ae5c70b013f2'
            '6a8dfcac852f1a37ee8393ec5db5140cfb1b4db8a9ca0bedbe19e910c103976a')

prepare() {
  _patch_ lvm2
}

build() {
  # build system requires bash:
  # https://www.redhat.com/archives/linux-lvm/2020-January/msg00004.html
  # https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Variables.html
  export CONFIG_SHELL=/bin/bash

  cd lvm2/

  ./configure \
    CONFIG_SHELL=/bin/bash \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-cmdlib \
    --enable-dmeventd \
    --enable-lvmpolld \
    --enable-pkgconfig \
    --enable-readline \
    --without-udev \
    --enable-write_install \
    --with-cache=internal \
    --with-default-dm-run-dir=/run \
    --with-default-locking-dir=/run/lock/lvm \
    --with-default-pid-dir=/run \
    --with-default-run-dir=/run/lvm \
    --with-libexecdir=/usr/lib/lvm2 \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-thin=internal
  make
}

package_device-mapper() {
  pkgdesc="Device mapper userspace library and tools"
  url="http://sourceware.org/dm/"
  provides=('libdevmapper.so' 'libdevmapper-event.so')

  cd lvm2/
  make DESTDIR="${pkgdir}" install_device-mapper
}

package_lvm2() {
  pkgdesc="Logical Volume Manager 2 utilities"
  depends=('bash' "device-mapper>=${pkgver}"
    'util-linux-libs' 'libblkid.so' 'readline' 'libreadline.so' 'libaio' 'libaio.so')
  backup=('etc/lvm/lvm.conf'
    'etc/lvm/lvmlocal.conf')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_lvm2
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}
}
