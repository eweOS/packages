# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frei0r-plugins
pkgver=2.4.0
pkgrel=1
pkgdesc='Collection of video effect plugins'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
makedepends=(
  cairo
  cmake
  gavl
  git
  ninja
)
optdepends=(
  'cairo: cairoaffineblend, cairoblend, cairogradient and cairoimagegrid plugins'
  'gavl: rgbparade, scale0tilt and vectorscope plugins'
  'opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
sha256sums=('638ea1b1bea65a0ffab4aaccd67615d690956a7a47429cfb0aafc00199aaec24')

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

