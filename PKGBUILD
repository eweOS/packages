# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kstatusnotifieritem
pkgver=6.15.0
pkgrel=2
pkgdesc='Implementation of Status Notifier Items'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-or-later)
depends=(kwindowsystem
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('24132cc967570478b54e44eef1063c193217801260dc51860e0881fa0d90bd0d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITHOUT_X11=ON \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
