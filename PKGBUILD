# Maintainer: Eric Long <i@hack3r.moe>

pkgname=gawk
pkgver=5.3.2
pkgrel=1
pkgdesc="GNU version of awk"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gawk/"
license=(GPL-3.0-or-later)
depends=(sh musl mpfr)
source=("https://ftp.gnu.org/pub/gnu/gawk/gawk-$pkgver.tar.gz")
sha256sums=('8639a1a88fb411a1be02663739d03e902a6d313b5c6fe024d0bfeb3341a19a11')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --without-libsigsegv
  make
}

# check depends on coreutils, disable until we switch to uutils-coreutils
# check() {
#   cd $pkgname-$pkgver
#   make check
# }

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  unlink "$pkgdir"/usr/bin/awk  # not providing awk
}
