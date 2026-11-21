# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crystal-dock
pkgver=2.16
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='A cool desktop panel for Linux desktop'
url='https://github.com/dangvd/crystal-dock'
license=('GPL-3.0-only')
depends=(qt6-base wayland layer-shell-qt)
makedepends=(cmake git extra-cmake-modules qt6-base wayland layer-shell-qt qt6-base-devel)
source=("git+https://github.com/dangvd/$pkgname.git#tag=v$pkgver")
sha256sums=('afa7a7484f79e435c2af5f499f37c70b6de3a59bc2a115631b69b3fc8d5f0af5')

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../src
  make
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" cmake --install build
}
