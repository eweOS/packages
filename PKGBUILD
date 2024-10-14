# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mypaint-brushes1
pkgver=1.3.1
pkgrel=1
pkgdesc='Brushes used by MyPaint and other software using libmypaint (v1.x)'
url='https://github.com/mypaint/mypaint-brushes'
arch=('any')
license=('custom:CC0')
depends=('libmypaint<2')
source=(https://github.com/mypaint/mypaint-brushes/archive/v${pkgver}/${pkgname/1/}-${pkgver}.tar.gz)
sha512sums=('3e65619ae9a042cd6314396a826a2b63a72066e761244dc8763910555715b1dff6aa4395b5322510b114d61bb486f909fe505a564c89a2a5e1e5087ed298d08b')

prepare() {
  cd ${pkgname/1/}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname/1/}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname/1/}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
