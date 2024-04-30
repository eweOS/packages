# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.6.2
pkgrel=2
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('aab95f567bfe4e09b7776be9cdc0d4c1f9df262762f22eed79e211d4f608df0168b0212f885926b7e0150afc39eb36c79e1702e8d08552e37202b9b0d8e4bc40')

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
