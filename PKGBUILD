# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpfr
pkgver=4.2.2
pkgrel=1
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.mpfr.org/'
license=(
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
depends=(gmp)
makedepends=(texinfo)
provides=(libmpfr.so)
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz disable-test.patch fix-loongarch64-int128.patch)
sha512sums=('eb9e7f51b5385fb349cc4fba3a45ffdf0dd53be6dfc74932dc01258158a10514667960c530c47dd9dfc5aa18be2bd94859d80499844c5713710581e6ac6259a9'
            '33227239872ba764c37dd5ff657e7133ec5f4ea28f13b907e68fdd3cf55c7c6dc7e24a476ac0113649399e333d9a331e1e94ddfb15debb29a2253016d7e1095a'
            '1c694aca25bf2c1d212d0bc9b9709e8c58e154d858985d8a21a384cdd9b0467ea323bcc4e3210482fba18bda72f92b373bc90e687c00019ae59ce6a5ac3c18a1')

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
