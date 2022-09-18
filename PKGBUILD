# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtr
pkgver=0.95
pkgrel=1
pkgdesc='Combines the functionality of traceroute and ping into one tool'
url='https://www.bitwizard.nl/mtr/'
arch=('x86_64')
license=('GPL2')
makedepends=('ncurses' 'libcap')
source=(
  https://github.com/traviscross/mtr/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  mtr.install
)
sha256sums=('SKIP' 'SKIP')

install=mtr.install

build() {
  cd ${pkgbase}-${pkgver}
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
