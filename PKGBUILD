# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.4.341.0
pkgrel=2
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('d73bc5036b6556b741f6985ff600ca720308c5f2850e4a43ceb498bd3de069e7')

build() {
  cmake -G Ninja -B build -S ${_pkgname}-vulkan-sdk-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
