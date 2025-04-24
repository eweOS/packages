# Maintainer:Yukari Chiba <i@0x7f.cc>

pkgname=gperf
pkgver=3.3
pkgrel=1
pkgdesc="Perfect hash function generator"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gperf/"
license=(GPL-3.0-or-later)
depends=(musl)
source=("https://ftp.gnu.org/pub/gnu/gperf/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8')

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
