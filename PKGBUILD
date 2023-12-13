# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spirv-tools
_pkgver=2023.3
_headerver=1.3.261.1
pkgver=${_pkgver}+${_headerver}
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=(x86_64 aarch64 riscv64)
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('llvm-libs')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/sdk-${_headerver}.tar.gz")
sha256sums=('ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008')

build()
{
  cd SPIRV-Tools-sdk-${_headerver}
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
  cd SPIRV-Tools-sdk-${_headerver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
