# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libqtxdg
pkgver=4.5.0
pkgrel=1
pkgdesc="Library providing freedesktop.org XDG specs implementations for Qt"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL-2.1-or-later" "LGPL-2.1-only WITH Qt-LGPL-exception-1.1")
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "lxqt-build-tools" 'qt6-base-devel')
provides=("libQt6Xdg.so" "libQt6XdgIconLoader.so")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('64edfa2bc219366be099ed37115be9a440f53800974cbc967bca0f7080bca1e5')

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON
  make
}

check() {
  cd build
  export QT_QPA_PLATFORM=offscreen
  ctest --output-on-failure
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver"/{AUTHORS,COPYING,Digia-Qt-LGPL-Exception-1.1} \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
