# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libsigsegv
pkgver=2.14
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
pkgdesc="Page fault detection library"
url="https://www.gnu.org/software/libsigsegv/"
license=('GPL2')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
