# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=zlib-ng
pkgname=(zlib-ng zlib-ng-static)
pkgver=2.2.1
pkgrel=2
pkgdesc='zlib data compression library for the next generation systems'
arch=(x86_64 aarch64 riscv64)
license=('custom')
url="https://github.com/zlib-ng/zlib-ng"
depends=(musl)
makedepends=(cmake googletest)
provides=(zlib)
conflicts=(zlib)
source=($pkgname-$pkgver::"https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ec6a76169d4214e2e8b737e0850ba4acb806c69eeace6240ed4481b9f5c57cdf')

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

package_zlib-ng()
{
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zlib/LICENSE"

  cd "$pkgdir"
  _pick_ zlib-ng-static usr/lib/libz.a
}

package_zlib-ng-static() {
  depends=(zlib-ng="$pkgver-$pkgrel")
  provides=(zlib-static)
  conflicts=()
  options=(!strip staticlibs)
  mv "$srcdir/pkgs/$pkgname"/* "$pkgdir"
}
