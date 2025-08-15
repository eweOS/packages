# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwindowsystem
pkgver=6.17.0
pkgrel=1
pkgdesc='Access to the windowing system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-declarative
             qt6-tools
             wayland-protocols)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('259abef58b09ad1a8022b5cb94831a98f3e5b5cc7c65f7a0b40be64361756f63')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DKWINDOWSYSTEM_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

