# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libqtxdg
pkgver=4.4.0
pkgrel=2
pkgdesc="Library providing freedesktop.org XDG specs implementations for Qt"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL" "custom")
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "lxqt-build-tools" 'qt6-base-devel')
checkdepends=("weston" "qt6-wayland")
provides=("libQt6Xdg.so" "libQt6XdgIconLoader.so")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('34d25949ae7b6275fb54da46187dd8ba41771600353405b15e53bdc90b9e287a')

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

  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver"/{AUTHORS,COPYING,Digia-Qt-LGPL-Exception-1.1} \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
