# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.10.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('34c97db9c885371c0d2e7b7f2d99ff8bf700f50927d1029335e6c6f2b71d990f30aab80b178def683a5d5901d0c2ef49ea9156414f918f0f8c5c904f2cb0bdc1')

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
