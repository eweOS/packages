# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.3.261.1
pkgrel=1
pkgdesc="SPIR-V Headers"
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('46d14e993d58e641ec4d2bb96e76f4f2bd8426fb1e33b77e7d053cea80dcf5ffae3d4d6136559d4a66387fba3a4e4a4a74ad5af83445a3be0d171e47414599e1')

build() {
  cmake -B build -S ${_pkg}-sdk-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-sdk-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
