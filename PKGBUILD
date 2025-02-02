# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
pkgver=3.31.5
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
sha256sums=('66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27'
            '61399bb31861e501da22d520badafc0ba4a7d4bc742aaa3352539065943e93b1')

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
  _install_license_ Copyright.txt
}
