# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=zlib-ng
pkgver=2.2.0
pkgrel=1
pkgdesc='zlib data compression library for the next generation systems'
arch=(x86_64 aarch64 riscv64)
license=('custom')
url="https://github.com/zlib-ng/zlib-ng"
depends=(musl)
makedepends=(cmake googletest)
provides=(zlib)
conflicts=(zlib)
source=($pkgname-$pkgver::"https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e688263f704cd2e5e5dbab07b0fd0f494c24d393be7d15da02e7ae76b630b76')

prepare()
{
  cd "$pkgname-$pkgver"
  grep -A 24 '^  Copyright' zlib.h.in > LICENSE
}

build()
{
  cd "$pkgname-$pkgver"
  cmake . -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build . --config Release
}

check()
{
  cd "$pkgname-$pkgver"
  ctest --verbose --output-on-failure -C Release
}

package()
{
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zlib/LICENSE"
}
