# Maintainer: YukariChiba <i@0x7f.cc>
pkgname=hwdata
pkgver=0.366
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v0.366.tar.gz")
sha256sums=('bdc91561ec210877e6d1e3ec3abf0305389d7bcc3bf616bcecb2bdf74e3a7696')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
