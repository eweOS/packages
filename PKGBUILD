# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libqtxdg
pkgver=4.2.0
pkgrel=1
pkgdesc="Library providing freedesktop.org XDG specs implementations for Qt"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL" "custom")
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "lxqt-build-tools")
checkdepends=("weston" "qt6-wayland")
provides=("libQt6Xdg.so" "libQt6XdgIconLoader.so")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('a5d430218550d66fa806debce7c418db41268286b17bdab46b8ce3a58f0fe82a')

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
