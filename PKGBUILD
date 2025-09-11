# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=layer-shell-qt
pkgver=6.4.5
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
             wayland-protocols)
optdepends=('qt6-declarative: QML bindings')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('ef6baae22114f038af89029f3f0075ee29c3b91fd49100828c4c3a32e1496e95')

build() {
  CFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"
  CXXFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"

  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
