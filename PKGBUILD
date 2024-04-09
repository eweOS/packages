# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hwdata
pkgver=0.381
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('53435c73964ddc24ac53fa86e29e8b9244ca1cab0578ffdd82fd280f35863004')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
