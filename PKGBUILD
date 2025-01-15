# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.4.304
pkgrel=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('5e1a06b3f27e7581b55d1dea176fd97ee0a2f299406db2f437c1d2f297ceba5b')

build() {
  cmake -G Ninja -B build -S ${_pkgname}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
