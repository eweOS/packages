# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fmt
pkgver=11.0.2
pkgrel=2
pkgdesc='Open-source formatting library for C++'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('6cb1e6d37bdcb756dbbe59be438790db409cdb4868c66e888d5df9f13f7c027f')

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
