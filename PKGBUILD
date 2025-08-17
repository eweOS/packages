# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwayland
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
	     linux-headers
             plasma-wayland-protocols
             qt6-tools
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('f458ae7ed1118e1a2165a37378c8ce0e9fff80d1a4cfe86217f06cf24ca49f9b')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

