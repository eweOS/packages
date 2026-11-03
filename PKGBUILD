# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hwdata
pkgver=0.413
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a71ab7a48c668ef912fcfdbec046949087019f8dd7fb967445d36fbeb778350')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
