# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=re2
_re2ver=2024-05-01
pkgrel=1
epoch=1
pkgver=${_re2ver//-/}
pkgdesc="Fast, safe, thread-friendly regular expression engine"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/google/re2"
license=('BSD')
depends=('llvm-libs' 'abseil-cpp')
checkdepends=('gtest' 'benchmark')
source=(re2-$pkgver.tar.gz::https://github.com/google/re2/archive/$_re2ver.tar.gz)
sha256sums=('fef2f366578401eada34f5603679fb2aebe9b409de8d275a482ce5f2cbac2492')

build()
{
  cd $pkgname-$_re2ver
  make
}

check()
{
  cd $pkgname-$_re2ver
  make test
}

package()
{
  cd $pkgname-$_re2ver
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
