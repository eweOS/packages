# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.7.1
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1b6b94f3253ac3ab3f8c69d1c852db2334c99cb7990b9656f5f2458198d1eb854e79cce0e39151aef0d5e01a740fc965651c6a57fda585f9a24c543f2693f78c')

build()
{
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -W no-dev \
    -B build \
    -S "$pkgname-$pkgver"
  make VERBOSE=1 -C build
}

package()
{
  make VERBOSE=1 DESTDIR="$pkgdir" -C build install
  install -vDm 644 "$pkgname-$pkgver/COPYING" -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -vDm 644 "$pkgname-$pkgver/"{AUTHORS,Changes,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
