# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libffi
pkgver=3.3
pkgrel=1
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64)
url='http://sourceware.org/libffi/'
license=(BSD)
groups=()
depends=()
makedepends=()
options=()
source=(
    "ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz"
)
sha256sums=(
    72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056
)


build() {
    cd ${pkgname}-${pkgver}
    ./configure \
      --prefix=/usr \
      --enable-shared
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
}

