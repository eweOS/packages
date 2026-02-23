# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=m4
pkgver=1.4.21
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc="The GNU macro processor"
url='http://www.gnu.org/software/m4/'
license=(GPL3)
depends=(musl bash)
source=("http://ftp.gnu.org/gnu/m4/m4-${pkgver}.tar.xz")
sha256sums=('f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver/checks"
  # Run M4 testsuite only: Gnulib testsuite depends on glibc-specific behaviour.
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir"/usr install
}
