# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwindowsystem
pkgver=6.20.0
pkgrel=3
pkgdesc='Access to the windowing system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
	     qt6-base-devel
             qt6-declarative
             qt6-tools
             wayland-protocols)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('836be005df3c8cfc81d9ca199f19e36ba0df515d69e7d8b06343465412f6f477')

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

