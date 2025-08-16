# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kstatusnotifieritem
pkgver=6.17.0
pkgrel=1
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
sha256sums=('678a9bfc870066d5413bbcfa09a56b82b0affd2bc222ce5701d02a8b129edd91')

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
