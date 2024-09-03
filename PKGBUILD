# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spirv-tools
_pkgver=2024.3
_headerver=1.3.290.0
pkgver=${_pkgver}+${_headerver}
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=(x86_64 aarch64 riscv64)
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('llvm-libs')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${_pkgver}.tar.gz")
#source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/sdk-${_headerver}.tar.gz")
sha256sums=('3961edff3410599112a50bfcda2d4a828f7cb12e8294ee0f6169976ef0532b83')

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
