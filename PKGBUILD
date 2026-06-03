# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.4.350.0
pkgrel=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('Apache-2.0 OR MIT')
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('70270d10bf2c1e074a06ee37a50b75d332993d1b80a1d9526eeed2da6d82ed22')

build() {
  cmake -G Ninja -B build -S ${_pkgname}-vulkan-sdk-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
