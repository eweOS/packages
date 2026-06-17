# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utf8cpp
pkgver=4.1.1
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
arch=(any)
url="https://github.com/nemtrif/utfcpp"
license=(BSL-1.0)
makedepends=(cmake)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1ca68016f0abc24172998e39ce0d8f8e2b7a26f7579a0ff85d4e1b9a7aea56f8')

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

