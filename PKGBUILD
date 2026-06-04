# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwayland
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=3
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
	     qt6-base-devel
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('5db0105edecec7f8b429940be1d26dffe2d9dfbb0d967e9e16bddb0a22cfd397')

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

