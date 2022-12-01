# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libffi
pkgver=3.4.3
pkgrel=1
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64)
url='http://sourceware.org/libffi/'
license=(BSD)
source=(
    "ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz"
)
sha256sums=(
    'SKIP'
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

