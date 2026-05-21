# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utf8cpp
pkgver=4.0.9
pkgrel=2
pkgdesc="UTF-8 with C++ in a Portable Way"
arch=(any)
url="https://github.com/nemtrif/utfcpp"
license=(BSL-1.0)
makedepends=(cmake)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('397a9a2a6ed5238f854f490b0177b840abc6b62571ec3e07baa0bb94d3f14d5a')

build() {
  cmake -B build -S ${pkgname/8}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUTF8_TESTS=OFF
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${pkgname/8}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

