# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.3.2
pkgrel=1
license=('GPL')
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('77d7aebeff95ee1c45366b7179456f9a6cf5202b505e232dc501aeb884df070cd42de7ded9610b69535bf29de784f90c9b263fc15061627043356008622b4573')

build() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
