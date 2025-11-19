# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdecoration
pkgver=6.5.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(ki18n
         qt6-base)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('2963dc44ff2b1cc7ea44cbb3800d35c4d0bcead783728179afda504cc0611576')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
