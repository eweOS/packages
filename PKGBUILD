# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vulkan-icd-loader
pkgver=1.3.294
pkgrel=1
arch=(x86_64 aarch64 riscv64)
pkgdesc="Vulkan Installable Client Driver (ICD) Loader"
url="https://www.khronos.org/vulkan/"
license=('custom')
makedepends=('cmake' 'wayland' 'vulkan-headers')
optdepends=('vulkan-driver: packaged vulkan driver') # vulkan-driver: vulkan-intel/vulkan-radeon/nvidia-utils/....
provides=('libvulkan.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Loader/archive/v${pkgver}.tar.gz")
sha256sums=('22933596b3b4b204800193426ce55364eef194705ee29e3f18c1f567d958e33e')

build() {
  cd "${srcdir}"/Vulkan-Loader*

  rm -rf build ; mkdir build ; cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DVULKAN_HEADERS_INSTALL_DIR=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DATADIR=/share \
    -DCMAKE_SKIP_RPATH=True \
    -DBUILD_TESTS=Off \
    -DBUILD_WSI_XCB_SUPPORT=Off \
    -DBUILD_WSI_XLIB_SUPPORT=Off \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "${srcdir}"/Vulkan-Loader*/build
  
  make DESTDIR="${pkgdir}" install
  
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

