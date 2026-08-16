# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
pkgver=4.4.2
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
sha256sums=('1db9e61e60b6e0874c86386340b910382f3c5e75b9fbfb44d122063129a2789d'
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
