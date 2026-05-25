# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libaec
pkgver=1.1.7
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=(BSD-2-Clause)
makedepends=(cmake)
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha256sums=('7cf0034eca8f53449252f2fab863d855aedc0520ceb8d3f3fcd3bd601ce4c85e')

build() {
  cmake -B build -S ${pkgname}-v${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  _install_license_ ${pkgname}-v${pkgver}/LICENSE.txt
}
