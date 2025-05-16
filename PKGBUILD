# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libsigsegv
pkgver=2.15
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc="Page fault detection library"
url="https://www.gnu.org/software/libsigsegv/"
license=('GPL2')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('036855660225cb3817a190fc00e6764ce7836051bacb48d35e26444b8c1729d9')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
