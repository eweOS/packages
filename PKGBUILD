# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fmt
pkgver=11.1.2
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
sha256sums=('d8773cf062cc806d4dd4df658111f15ba7a2c9c65db5084d2491696828b1eb97')

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
