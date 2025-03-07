# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hwdata
pkgver=0.393
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('322add86944680e99d04468d49de180a7ce0c77fb406f7abde8ab14f2d161051')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
