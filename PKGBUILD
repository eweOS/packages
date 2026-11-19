# Maintainer: Eric Long <i@hack3r.moe>

pkgname=gawk
pkgver=5.4.2
pkgrel=1
pkgdesc="GNU version of awk"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gawk/"
license=(GPL-3.0-or-later)
depends=(sh musl mpfr)
source=("https://ftp.gnu.org/pub/gnu/gawk/gawk-$pkgver.tar.gz")
sha256sums=('79c46f5de14401663c63c8df4fc45c3bda76f6329d73b213523a7c71f32f7243')

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
