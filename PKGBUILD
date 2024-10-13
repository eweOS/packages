# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=opencl-headers
pkgver=2024.05.08
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files'
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('Apache-2.0')
makedepends=(cmake python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('3c3dd236d35f4960028f4f58ce8d963fb63f3d50251d1e9854b76f1caab9a309')
optdepends=('opencl-clhpp: C++ support')

build() {
  cmake -B build -S OpenCL-Headers* \
    -DCMAKE_INSTALL_PREFIX=/usr \

  cmake --build build
}

package() {
 DESTDIR="$pkgdir" cmake --install build

 install -D -m644 OpenCL-Headers*/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
