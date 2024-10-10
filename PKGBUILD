# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=graphite
pkgname=(graphite)
pkgver=1.3.14
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/silnrsi/graphite"
pkgdesc='reimplementation of the SIL Graphite text processing engine'
license=('LGPL-2.1-or-later OR MPL-2.0 OR GPL-2.0-or-later')
makedepends=('cmake' 'freetype2' 'python')
checkdepends=('python-fonttools')
source=(https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz)
sha256sums=('f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d')

prepare() {
  cd graphite2-${pkgver}
  sed -i 's/gcc_s//; s/gcc//' src/CMakeLists.txt
}

build() {
  local cmake_options=(
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DGRAPHITE2_COMPARE_RENDERER=OFF
    -DGRAPHITE2_VM_TYPE=direct
  )

  cmake -S graphite2-${pkgver} -B build "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package_graphite() {
  optdepends=('graphite-docs: Documentation')
  provides=('libgraphite2.so')

  DESTDIR="$pkgdir" cmake --install build

  # licenses
  install -Dm644 graphite2-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
