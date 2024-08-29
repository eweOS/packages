# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.3.294
pkgrel=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('7c3844f5bd6648d5c13941941cd72b42d7f5a5dd5fbaaff546e92eb73e216b13')

build() {
  cmake -G Ninja -B build -S ${_pkgname}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
