# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ocean-sound-theme
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('f13f85e49cac35be429c50e95b21ce281f4a6bba02ecd006a073adcd4f299ab8')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
