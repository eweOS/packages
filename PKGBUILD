# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=glslang
pkgname=(glslang glslang-static)
pkgver=15.4.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/KhronosGroup/glslang'
license=('BSD-3-Clause')
depends=('spirv-tools')
makedepends=('cmake' 'ninja' 'spirv-headers' 'python')
options=('staticlibs')
source=(${pkgbase}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz)
sha256sums=('b16c78e7604b9be9f546ee35ad8b6db6f39bbbbfb19e8d038b6fe2ea5bba4ff4')

build() {
  cd ${pkgbase}-${pkgver}

  cmake \
    -Bbuild-static \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
    -DBUILD_SHARED_LIBS=OFF
  cmake --build build-static
  cmake \
    -Bbuild-shared \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DGLSLANG_TESTS=ON
  cmake --build build-shared
}

check() {
  cd ${pkgbase}-${pkgver}
  ninja -Cbuild-shared test
}

package_glslang() {
  cd ${pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build-shared

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE

  cd "${pkgdir}"/usr/lib
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
}

package_glslang-static() {
  cd ${pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build-static

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
