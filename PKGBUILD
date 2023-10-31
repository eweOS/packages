# Maintainer: YukariChiba <i@0x7f.cc>
pkgname=hwdata
pkgver=0.375
_pkgver=$pkgver
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('69ffbfe4801c12c2d66d51f98044beec35afa406b1baa619c57b25a9b62b43a0')

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
}
