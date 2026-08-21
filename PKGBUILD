# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprgraphics
pkgver=0.5.1
pkgrel=5
pkgdesc="Hyprland graphics / resource utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprgraphics"
license=('BSD-3-Clause')
depends=('pixman' 'cairo' 'hyprutils' 'libjpeg' 'libjxl' 'libwebp' 'file' 'libspng' 'librsvg' 'pango' 'libdrm')
makedepends=('git' 'cmake' 'libglvnd' 'linux-uapi-headers')
source=(
  "git+https://github.com/hyprwm/hyprgraphics.git#tag=v$pkgver"
)
sha256sums=('05c6a7d5a6feab67cce299f378cf45c68ddfb6dfbfc11b1a69a00eac9e45f2b0')

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
