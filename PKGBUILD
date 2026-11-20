# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libkscreen
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE screen management software'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
	     qt6-base-devel
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('8f0e2157bb55aa36ac632c85bd4411bcbf2424c477cca3126b8b42ad33fa4fb8')

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
