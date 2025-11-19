# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ocean-sound-theme
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.5.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('7e3bb59309e54f8aa3e6303a70dac0eba91662e0a0709d041fd073722f06ee91')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
