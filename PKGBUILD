# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpciaccess
pkgver=0.16
pkgrel=1
pkgdesc="X11 PCI access library"
arch=(x86_64)
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('musl')
makedepends=()
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
