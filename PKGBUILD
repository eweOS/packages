# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spirv-tools
epoch=1
pkgver=1.4.309.0
_pkgver=vulkan-sdk-$pkgver
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('llvm-libs')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('6b8577054c575573ead3ad71cb6a2c0b3397b64c746cc3c99e48cc5e324c1b55')

build()
{
  cd SPIRV-Tools-${_pkgver}
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DSPIRV_WERROR=Off \
    -DBUILD_SHARED_LIBS=ON \
    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
    -DSPIRV-Headers_SOURCE_DIR=/usr
  ninja -C build
}

package()
{
  cd SPIRV-Tools-${_pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
