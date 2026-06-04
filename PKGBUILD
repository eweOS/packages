# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kunitconversion
pkgver=6.26.0
pkgrel=1
pkgdesc='Support for unit conversion'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(ki18n
         qt6-base)
makedepends=(extra-cmake-modules
             python-build
             python-setuptools
             qt6-tools)
optdepends=('pyside6: Python bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('94404453011eec373f858ef4a58091d24fbadbb90f96bbbf470c098646d9675e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
