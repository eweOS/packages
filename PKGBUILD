# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprgraphics
pkgver=0.1.2
pkgrel=1
pkgdesc="Hyprland graphics / resource utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprgraphics"
license=('BSD-3-Clause')
depends=('pixman' 'cairo' 'hyprutils' 'libjpeg' 'libjxl' 'libwebp' 'file')
makedepends=('git' 'cmake')
source=("git+https://github.com/hyprwm/hyprgraphics.git#tag=v$pkgver")
sha256sums=('ad934e73dc3449fff98180255650da0621a250832fc4b2acf816d9432fa22ec5')

prepare() {
  cd "$srcdir/$pkgname"
  # std::min
  sed -i '1i #include <algorithm>' src/color/Color.cpp
}

build() {
  cd "$srcdir/$pkgname"
  cmake --no-warn-unused-cli \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S . -B ./build
  cmake --build ./build \
    --config Release --target hyprgraphics
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ LICENSE
}
