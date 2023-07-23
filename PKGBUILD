# Maintainer: YukariChiba <i@0x7f.cc>
pkgname=hwdata
pkgver=0.372
_pkgver=0.370
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v0.370.tar.gz")
sha256sums=('bb4f0a6612ed7e2906fb36c29f1b531aba6eaa0938f4be0272eed2472d6b2dd6')

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
}
