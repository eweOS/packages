# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qtxdg-tools
pkgver=4.5.0
pkgrel=1
pkgdesc="libqtxdg user tools"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/qtxdg-tools"
license=("LGPL2.1")
depends=("qt6-base" "libqtxdg")
makedepends=("cmake" "qt6-tools" "lxqt-build-tools")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('4532035802a8b08d5475ed8b054e417366327e85f43dd3c1bf1ab1864e422701')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
