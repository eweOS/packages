# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frei0r-plugins
pkgver=2.5.1
pkgrel=3
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
sha256sums=('3a155c715bbf63fa6faa7d05815dabeb1e3686b4c13f4ee67b1232aa894390cf')

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

