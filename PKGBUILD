# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frei0r-plugins
pkgver=2.3.3
pkgrel=1
pkgdesc='Collection of video effect plugins'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('8d0f2e8386ff070eaccc6764e4240b8da7cc67ea2899a73e94e11a5c5f21944c')

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

