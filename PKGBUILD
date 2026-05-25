# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
pkgver=4.3.3
_major_minor=${pkgver%.*}
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(openssl)
makedepends=(linux-headers)
url='https://cmake.org'
license=(BSD-3-Clause)
source=("$url/files/v$_major_minor/$pkgname-$pkgver.tar.gz"
	"detect-eweOS.patch")
sha256sums=('cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85'
            '02c915139f6041e4fc93ed4e0a1bdd9f635eb92bd14efab234c9bd238730d9a8')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build()
{
  cd "$pkgname-$pkgver"
  ./bootstrap --prefix=/usr
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE.rst
}
