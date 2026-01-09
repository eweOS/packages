# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=layer-shell-qt
pkgver=6.5.4
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
sha256sums=('bb95db253ffcd29e08191656b6a5449f8a8800c38256873e2529749b55eaa80a')

build() {
  CFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"
  CXXFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"

  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
