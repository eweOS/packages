# Maintainer: Eric Long <i@hack3r.moe>

pkgname=gawk
pkgver=5.4.0
pkgrel=2
pkgdesc="GNU version of awk"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gawk/"
license=(GPL-3.0-or-later)
depends=(sh musl mpfr)
source=("https://ftp.gnu.org/pub/gnu/gawk/gawk-$pkgver.tar.gz")
sha256sums=('df5756d50772212a8e3f26d903107ece3773c4037c6a9e0a59c2a0a8d7329f0d')

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
