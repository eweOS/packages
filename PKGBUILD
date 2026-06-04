# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kstatusnotifieritem
pkgver=6.26.0
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
sha256sums=('898914c94820f99889d879f33cabbb5fbe7b9f4e24a6a1d9a9b4439489bc3266')

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
