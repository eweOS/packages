# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libprocps
pkgver=3.3.17
pkgrel=2
pkgdesc='procps 3.x libraries for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL' 'LGPL')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('libprocps.so')
makedepends=('autoconf')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz")
sha256sums=('4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4')

prepare() {
  sed -i '1i #include <langinfo.h>' procps-${pkgver}/proc/escape.c

  cd procps-${pkgver}
  autoreconf -fiv
}

build() {
  cd procps-${pkgver}

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
  cd procps-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,share}
}
