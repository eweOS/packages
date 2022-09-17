# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd
pkgver=1.5.2
pkgrel=7
pkgdesc='Zstandard - Fast real-time compression algorithm'
url='https://facebook.github.io/zstd/'
arch=(x86_64)
license=(BSD GPL2)
depends=(zlib xz lz4)
makedepends=(cmake ninja)
provides=(libzstd.so)
source=(https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz)
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  # avoid error on tests without static libs, we use LD_LIBRARY_PATH
  sed '/build static library to build tests/d' -i build/cmake/CMakeLists.txt
  sed 's/libzstd_static/libzstd_shared/g' -i build/cmake/tests/CMakeLists.txt
}

build() {
  cd ${pkgname}-${pkgver}
  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'

  cmake -S build/cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DZSTD_BUILD_CONTRIB=ON \
    -DZSTD_BUILD_STATIC=OFF \
    -DZSTD_BUILD_TESTS=ON \
    -DZSTD_PROGRAMS_LINK_SHARED=ON
  cmake --build build
}

check() {
  cd ${pkgname}-${pkgver}
  export LD_LIBRARY_PATH="$(pwd)/build/lib"
  # only run fullbench for faster packaging
  ctest -VV -R fullbench --test-dir build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build
  ln -sf /usr/bin/zstd "${pkgdir}/usr/bin/zstdmt"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
