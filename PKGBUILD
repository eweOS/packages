# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.6.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ec24bff301eb887232d9e0c9051a7aa5f0461adc0c7918dda3e96fe7a0a9a5b8bdccfb4a82f99643ea1a3a1da28f698a31be1848eacb2ec3eaec6453733e4667')

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
