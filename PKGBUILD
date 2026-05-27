# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dos2unix
pkgver=7.5.5
pkgrel=1
pkgdesc='Text file format converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://waterlan.home.xs4all.nl/dos2unix.html'
license=('BSD-2-Clause')
makedepends=('perl')
checkdepends=('perl')
conflicts=('hd2u')
source=(https://waterlan.home.xs4all.nl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33')

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

