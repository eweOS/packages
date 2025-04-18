# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.4.309.0
pkgrel=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('2bc1b4127950badc80212abf1edfa5c3b5032f3425edf37255863ba7592c1969')

build() {
  cmake -G Ninja -B build -S ${_pkgname}-vulkan-sdk-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
