# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fmt
pkgver=10.0.0
pkgrel=1
pkgdesc='Open-source formatting library for C++'
arch=(x86_64 aarch64)
url=https://fmt.dev
license=(MIT)
makedepends=(
  cmake
  ninja
)
source=(
  https://github.com/fmtlib/fmt/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('ede1b6b42188163a3f2e0f25ad5c0637eca564bd8df74d02e31a311dd6b37ad8')

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
  install -Dm 644 fmt-$pkgver/LICENSE.rst -t "${pkgdir}"/usr/share/licenses/fmt/
}
