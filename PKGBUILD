# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hwdata
pkgver=0.387
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c6be8f0863a8ff5c83b2c46aa525b503b30d42792ed57891c40849de543e1ee')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
