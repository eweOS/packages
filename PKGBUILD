# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frei0r-plugins
pkgver=3.1.3
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
  opencv
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
sha256sums=('29876d59322d4d680b76ddf155484ef7f9f136522e633741609ccf16c47f647c')

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

