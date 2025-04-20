# Maintainer:Yukari Chiba <i@0x7f.cc>

pkgname=gperf
pkgver=3.2.1
pkgrel=1
pkgdesc="Perfect hash function generator"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gperf/"
license=(GPL-3.0-or-later)
depends=(musl)
source=("https://ftp.gnu.org/pub/gnu/gperf/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed5ad317858e0a9badbbada70df40194002e16e8834ac24491307c88f96f9702')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
