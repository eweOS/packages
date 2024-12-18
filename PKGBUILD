# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmpc
pkgver=1.3.1
pkgrel=1
pkgdesc='Library for the arithmetic of complex numbers with arbitrarily high precision'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.multiprecision.org/'
license=(LGPL-3.0-only)
depends=(gmp
         mpfr)
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz)
sha256sums=('ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8')
build() {
  cd mpc-$pkgver
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd mpc-$pkgver
  make check
}

package() {
  cd mpc-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/{mpc,libmpc}.info
}
