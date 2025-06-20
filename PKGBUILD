# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libaec
pkgver=1.1.4
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=(custom)
makedepends=(cmake)
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha256sums=('cf869c166656a83857adf62a092311a0069855c6ced3446e3f090a6d52279f65')

build() {
  cmake -B build -S ${pkgname}-v${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${pkgname}-v${pkgver}/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
