# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprgraphics
pkgver=0.5.0
pkgrel=1
pkgdesc="Hyprland graphics / resource utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprgraphics"
license=('BSD-3-Clause')
depends=('pixman' 'cairo' 'hyprutils' 'libjpeg' 'libjxl' 'libwebp' 'file' 'libspng' 'librsvg' 'pango')
makedepends=('git' 'cmake')
source=("git+https://github.com/hyprwm/hyprgraphics.git#tag=v$pkgver")
sha256sums=('1a8d0cf5dfcafee750a368c33a92587e6fd6db240a79128aaddeac6c4357df70')

prepare() {
  cd "$srcdir/$pkgname"
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
