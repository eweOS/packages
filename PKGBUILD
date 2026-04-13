# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libprocps
pkgver=4.0.6
pkgrel=1
pkgdesc='procps 3.x libraries for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('libprocps.so')
makedepends=('autoconf')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz")
sha256sums=('67bea6fbc3a42a535a0230c9e891e5ddfb4d9d39422d46565a2990d1ace15216')

prepare() {
  cd procps-ng-${pkgver}
  autoreconf -fiv
}

build() {
  cd procps-ng-${pkgver}

  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --enable-watch8bit \
    --disable-modern-top \
    --disable-kill
  make
}

package() {
  cd procps-ng-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,share}
}
