# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=liblxqt
pkgver=2.1.0
pkgrel=1
pkgdesc="Common base library for LXQt components"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("kwindowsystem" "libQt6Xdg.so")
makedepends=("lxqt-build-tools")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  no-x11.patch
)
sha256sums=('10820b62f83c5f53439b8690c9d71deaad7aa31e6506f9ec53cb789d47b13ce0'
            '78f1c2d6661f6ec3ce564767398a4cb4f5753721cfe145cad109f9ad1b60a1d1')

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
