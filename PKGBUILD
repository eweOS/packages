# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=soundtouch
pkgver=2.4.1
pkgrel=1
pkgdesc='An audio processing library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://www.surina.net/soundtouch/
license=(LGPL-2.1-only)
makedepends=(
  cmake
  git
  ninja
)
source=(
  git+https://codeberg.org/soundtouch/soundtouch.git#tag=$pkgver
  soundtouch-cmake.patch
)
sha256sums=('006515e3e2b0fc5a08f3c3783aec7a77a1fcffdab3bc437764e55eb577bbc066'
            '68c0d37b8b9ea329634d55211d1a8761650700e61cd9d4fc51fe6395f0288ce0')

prepare() {
  cd soundtouch
  # install autotools files
  patch -Np1 -i ../soundtouch-cmake.patch
  # cmake doesn't generate files for autotools
  autoreconf -fiv
  ./configure --prefix=/usr --enable-shared
}

build() {
  cmake -S soundtouch -B build -G Ninja \
    -DCMAKE_BUILD_TYPE='' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
