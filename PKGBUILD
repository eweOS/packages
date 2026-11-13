# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=liblxqt
pkgver=2.5.0
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
sha256sums=('b5092b82f77d9de123f30d155e0cf8a53e697397f30e5c8f6a55fc115d698447'
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
