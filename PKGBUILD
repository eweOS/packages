# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ocean-sound-theme
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('ce629cc9990a3dc381d3bd45c37838a618f51021761a37671e74b9a45624a12c')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
