# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=zlib-ng
pkgver=2.1.6
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
sha256sums=('a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2')

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
