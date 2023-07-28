# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.5.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f1ff7da5fafb47dcd6e0f0d892826aba6de76509c8497bc00382f1109ab8e2a93d396943dbb52216457044993a39d73728048adf650d8e83e28189edc7b78402')

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
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  install -vDm 644 "$pkgname-$pkgver/COPYING" -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -vDm 644 "$pkgname-$pkgver/"{AUTHORS,Changes,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
