# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fmt
pkgver=11.1.4
pkgrel=1
pkgdesc='Open-source formatting library for C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://fmt.dev
license=(MIT)
makedepends=(
  cmake
  ninja
)
provides=(libfmt.so)
source=(
  https://github.com/fmtlib/fmt/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('ac366b7b4c2e9f0dde63a59b3feb5ee59b67974b14ee5dc9ea8ad78aa2c1ee1e')

build() {
  cmake -S fmt-$pkgver -B build -G Ninja \
    -DCMAKE_CXX_FLAGS="-DFMT_USE_FLOAT128=0" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cd build
  # https://github.com/fmtlib/fmt/issues/3049
  ctest --output-on-failure \
    -E 'chrono-test|unicode-test|xchar-test'
  #cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  _install_license_ fmt-$pkgver/LICENSE LICENSE
}
