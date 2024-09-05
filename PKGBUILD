# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=expat
pkgver=2.6.3
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64 aarch64 riscv64)
url="https://libexpat.github.io/"
license=(MIT)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0c0f0df947bbe7084ba2bffce082bc40e061cbf02363f3043e8e6be33b71277dbf13fd54dcc0f641b704293e3faea5b8c1d3c752737db4c908097bf5df8bd02d')

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
