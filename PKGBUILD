# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pugixml
pkgver=1.14
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support"
arch=(x86_64 aarch64 riscv64)
url="https://pugixml.org"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/zeux/pugixml/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015')

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
