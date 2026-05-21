# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd
pkgver=15.3
pkgrel=2
pkgdesc='Engine for running Transport Tycoon Deluxe'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.openttd.org'
license=(GPL-2.0-or-later)
depends=(fluidsynth fontconfig hicolor-icon-theme)
makedepends=(cmake ninja)
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("https://cdn.$pkgname.org/$pkgname-releases/$pkgver/$pkgname-$pkgver-source.tar.xz")
sha256sums=('5ea21eea7d59c78a42071924ac18c6bc0116088f2e96b14cfee9369175973be7')

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
