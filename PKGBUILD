# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcoreaddons
pkgver=6.32.0
pkgrel=1
pkgdesc='Addons to QtCore'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(linux-headers
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f7373a77afae97099de4359fba13987b46618ccb952f94ddc11c9d31277fe651')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
