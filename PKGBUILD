# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.8.4
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e4f2af334a91784c0e84faf090073cab45639d1ecbf5747cf6582501d6c111c20c5bf2607925a277aca42931b2b0512cdcb4dfcde0d68171a546b30414a8442')

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
