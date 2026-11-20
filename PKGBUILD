# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libsigsegv
pkgver=2.16
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc="Page fault detection library"
url="https://www.gnu.org/software/libsigsegv/"
makedepends=(linux-headers)
license=('GPL-2.0-only')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f8b2fac06c091fc29d6474733d118dc163ed7cd6be4783240d31ad7af11efa30')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
