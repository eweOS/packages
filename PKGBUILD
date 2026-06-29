# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=layer-shell-qt
pkgver=6.7.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Qt component to allow applications to make use of the Wayland wl-layer-shell protocol'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             qt6-base-devel
             wayland-protocols)
optdepends=('qt6-declarative: QML bindings')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('032a3f5433f1913291a595e33ca08a0a4c7e22e2d7ce37f5f728247696c61188')

build() {
  CFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"
  CXXFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"

  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
