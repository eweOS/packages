# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libaec
pkgver=1.1.3
pkgrel=2
pkgdesc="Adaptive Entropy Coding library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=(custom)
makedepends=(cmake)
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha256sums=('46216f9d2f2d3ffea4c61c9198fe0236f7f316d702f49065c811447186d18222')

build() {
  cmake -B build -S ${pkgname}-v${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${pkgname}-v${pkgver}/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  mv "${pkgdir}"/usr/{,lib}/cmake
}
