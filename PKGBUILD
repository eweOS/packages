# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dos2unix
pkgver=7.5.4
pkgrel=2
pkgdesc='Text file format converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://waterlan.home.xs4all.nl/dos2unix.html'
license=('BSD-2-Clause')
makedepends=('perl')
checkdepends=('perl')
conflicts=('hd2u')
source=(https://waterlan.home.xs4all.nl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21')

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

