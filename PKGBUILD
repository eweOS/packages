# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qtxdg-tools
pkgver=4.3.0
pkgrel=1
pkgdesc="libqtxdg user tools"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/qtxdg-tools"
license=("LGPL2.1")
depends=("qt6-base" "libqtxdg")
makedepends=("cmake" "qt6-tools" "lxqt-build-tools")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6d84dc5016464741a6fbc466b94120267ea5333ebe037b9b0e1799846165ef96')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
