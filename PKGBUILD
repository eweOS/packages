# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
pkgver=4.4.3
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
sha256sums=('c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0'
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
