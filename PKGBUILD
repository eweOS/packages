# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pugixml
pkgver=1.16
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pugixml.org"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/zeux/pugixml/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('4cee1ca4aad395170f4c7a07824f3bdd41f28316c6e1e1090a1425b278ec0b4b')

build() {
    cmake -B build -S ${pkgname}-${pkgver%.1} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 ${pkgname}-${pkgver%.1}/readme.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
