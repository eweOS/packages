# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=glslang
pkgname=(glslang glslang-static)
epoch=1
pkgver=1.4.350.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/KhronosGroup/glslang'
license=('BSD-3-Clause')
depends=('spirv-tools')
makedepends=('cmake' 'ninja' 'spirv-headers' 'python')
options=('staticlibs')
source=(${pkgbase}-${pkgver}.tar.gz::$url/archive/vulkan-sdk-${pkgver}.tar.gz)
sha256sums=('a6885b1631fd77c89cd689b939cf2b3032c5ec13ee99250270d34bcad1efc10c')

build() {
  cd ${pkgbase}-vulkan-sdk-${pkgver}

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
  cd ${pkgbase}-vulkan-sdk-${pkgver}
  ninja -Cbuild-shared test
}

package_glslang() {
  cd ${pkgbase}-vulkan-sdk-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build-shared

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE

  cd "${pkgdir}"/usr/lib
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
}

package_glslang-static() {
  cd ${pkgbase}-vulkan-sdk-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build-static

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
