# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.4.8
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libexpat.so)
options=(debug)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('SKIP')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -W no-dev \
        -B build \
        -S "$pkgname-$pkgver"
  make VERBOSE=1 -C build
}

package() {
  make VERBOSE=1 DESTDIR="$pkgdir" -C build install
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  install -vDm 644 "$pkgname-$pkgver/COPYING" -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -vDm 644 "$pkgname-$pkgver/"{AUTHORS,Changes,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
