# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdecoration
pkgver=6.1.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=(x86_64 aarch64 riscv64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(ki18n
         qt6-base)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('3ce16cea659d863f78eb93d567bf952b3f66440becd424b06d2041ff0679def7')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
