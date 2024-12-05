# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=soundtouch
pkgver=2.3.3
pkgrel=1
pkgdesc='An audio processing library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://www.surina.net/soundtouch/
license=(LGPL2.1)
makedepends=(
  cmake
  git
  ninja
)
source=(
  git+https://codeberg.org/soundtouch/soundtouch.git#tag=$pkgver
  soundtouch-cmake.patch
)
sha256sums=('60ed34e8efe81938e6782d78d5ef5ab347a08ff57b47395043853ebeb0eee3ab'
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
