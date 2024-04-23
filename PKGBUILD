# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.3.280
pkgrel=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('717b49c52dbd37c78cf2f7f0fc715292c42e74841219e6cca918cd293ad5dce4')

build() {
  cd ${_pkgname}-$pkgver
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd ${_pkgname}-$pkgver/build
  make DESTDIR="${pkgdir}" install
}
