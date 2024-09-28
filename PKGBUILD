# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kidletime
pkgver=6.6.0
pkgrel=1
pkgdesc='Monitoring user activity'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-tools
             qt6-wayland
             wayland-protocols)
optdepends=('qt6-wayland: Wayland plugin'
            'wayland: Wayland plugin')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('82480a6f06039c2b7e04a75c69f1151b1784edc7bcd27097ac6264b1aa15f427')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

