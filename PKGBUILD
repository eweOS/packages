# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spirv-tools
pkgver=2023.2
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=(x86_64 aarch64 riscv64)
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('llvm-libs')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7416cc8a98a10c32bacc36a39930b0c5b2a484963df5d68f388ed7ffee1faad3')

build()
{
  cd SPIRV-Tools-${pkgver}
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
  cd SPIRV-Tools-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
