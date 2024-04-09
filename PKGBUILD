# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.3.1
pkgrel=1
license=('GPL')
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e67fa0662cf364c8fd11c237e3dad611a2334e0d7876f017fa5efa5d27f25838ffb792b5f7d9a2a319fa4208b484eceafee1dec9db7120df448f5ef085384dd9')

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
