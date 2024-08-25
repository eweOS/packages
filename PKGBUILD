# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd
pkgver=14.1
pkgrel=1
pkgdesc='Engine for running Transport Tycoon Deluxe'
arch=(x86_64 aarch64 riscv64)
url='https://www.openttd.org'
license=(GPL)
depends=(fluidsynth fontconfig hicolor-icon-theme)
makedepends=(cmake ninja)
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("https://cdn.$pkgname.org/$pkgname-releases/$pkgver/$pkgname-$pkgver-source.tar.xz")
sha256sums=('2c14c8f01f44148c4f2c88c169a30abcdb002eb128a92b9adb76baa76b013494')

prepare() {
  sed -i '/sse/d;/SSE/d' $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_BINDIR=bin \
    -D CMAKE_INSTALL_DATADIR=/usr/share \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S $pkgname-$pkgver
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
