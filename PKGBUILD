# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.8.2
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('378fe8b8319d1654dae09e2ce15e0dcff68e735eb9e28728b7bee7f60c81781025c3fccd6b620589529a6e63d94d0812474dc4c09721e5a3ea64dbc1efb623dd')

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
