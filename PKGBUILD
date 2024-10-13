# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpfr
pkgver=4.2.1
pkgrel=1
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64 aarch64 riscv64)
url='https://www.mpfr.org/'
license=(
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
depends=(gmp)
makedepends=(texinfo)
provides=(libmpfr.so)
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz disable-test.patch)
sha512sums=('bc68c0d755d5446403644833ecbb07e37360beca45f474297b5d5c40926df1efc3e2067eecffdf253f946288bcca39ca89b0613f545d46a9e767d1d4cf358475'
            '33227239872ba764c37dd5ff657e7133ec5f4ea28f13b907e68fdd3cf55c7c6dc7e24a476ac0113649399e333d9a331e1e94ddfb15debb29a2253016d7e1095a')

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-thread-safe \
    --enable-shared
  make
}

check() {
  cd $pkgname-$pkgver
  make check
  make check-exported-symbols
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
