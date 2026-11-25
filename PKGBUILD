# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.11.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4c74192969a073b152e8779dbfb624300ffcacec5b040c59e4da50c0a72a591d2ea70ef8824c593c73130bddd5eef0a5c85c2548163f38964cd1bd44328d6957')

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
