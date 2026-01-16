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
# 0001-backport-add-missing-span: add missing #include <span>
# https://github.com/hyprwm/hyprgraphics/commit/f114ea3d978629279b0dfa94459a346b198aff29
source=(
  "git+https://github.com/hyprwm/hyprgraphics.git#tag=v$pkgver"
  0001-backport-add-missing-span.patch::https://github.com/hyprwm/hyprgraphics/commit/f114ea3d978629279b0dfa94459a346b198aff29.patch
)
sha256sums=('1a8d0cf5dfcafee750a368c33a92587e6fd6db240a79128aaddeac6c4357df70'
            'efd6985b36945cfc39ca9896a0edc19e2a7a86a0bb2cbc94727a59109a2abd7e')

prepare() {
  _patch_ "$pkgname"
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
