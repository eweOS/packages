# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ocean-sound-theme
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('ddd87c9021947a5eff06e2f92566b9d81fe06ea444430745e896d647994e37eb')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
