# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dos2unix
pkgver=7.5.7
pkgrel=1
pkgdesc='Text file format converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://waterlan.home.xs4all.nl/dos2unix.html'
license=('BSD-2-Clause')
makedepends=('perl')
checkdepends=('perl')
conflicts=('hd2u')
source=(https://waterlan.home.xs4all.nl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b900ed9a92ef9b2548a6ac708ec81f724c59f2c089ed90f8e39a4e1287b28c1f')

build() {
  cd $pkgname-$pkgver
  make LDFLAGS_USER="${LDFLAGS}"
}

check() {
  cd $pkgname-$pkgver
  make LDFLAGS_SUER="${LDFLAGS}" check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

