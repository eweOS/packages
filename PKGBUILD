# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=liblxqt
pkgver=2.5.1
pkgrel=1
pkgdesc="Common base library for LXQt components"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL-2.1-or-later")
depends=("kwindowsystem" "libQt6Xdg.so")
makedepends=("lxqt-build-tools")
# 0001: Downstream, build without X11 since eweOS is Wayland-only
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  0001-no-x11.patch
)
sha256sums=('5afcd6093733434e8c91d4fea583fc3597f35f1b751eed750e5e31e1beed063d'
            'f82b94ce2e957bb5a45d7f4e2f4381a45771b63938fe998153137eddc9fdf07e')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_BACKLIGHT_LINUX_BACKEND=OFF
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
