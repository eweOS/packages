# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iso-codes
pkgver=4.20.1
pkgrel=2
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL-2.1-only)
makedepends=(python meson)
source=(https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$pkgver/iso-codes-v$pkgver.tar.gz)
sha256sums=('2d7d9f6084ab9ce6c534ce71a3dd5144b6e474f3c97616459a88f73f44a64bff')

build() {
  meson build $pkgname-v$pkgver \
    --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
