# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frei0r-plugins
pkgver=2.3.3
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
sha256sums=('8d0f2e8386ff070eaccc6764e4240b8da7cc67ea2899a73e94e11a5c5f21944c')

prepare() {
  cd frei0r
  # Backport, fix CMake 4.0 compatibility
  git cherry-pick -n 31efba74b26c161125c6c41d381dcf3f6207a728
}

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

