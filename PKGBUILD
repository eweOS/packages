# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcolorscheme
pkgver=6.6.0
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kguiaddons
         ki18n
         qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('657839e1ff8141ff09705be912e276a2dc98df122f5bcc2fdc3ed11d10100cd1')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
