# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=zlib-ng
pkgname=(zlib-ng zlib-ng-static)
pkgver=2.2.2
pkgrel=3
pkgdesc='zlib data compression library for the next generation systems'
arch=(x86_64 aarch64 riscv64)
license=('custom')
url="https://github.com/zlib-ng/zlib-ng"
depends=(musl)
makedepends=(cmake googletest)
source=($pkgname-$pkgver::"https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fcb41dd59a3f17002aeb1bb21f04696c9b721404890bb945c5ab39d2cb69654c')

prepare()
{
  cd "$pkgname-$pkgver"
  grep -A 24 '^  Copyright' zlib.h.in > LICENSE
}

build()
{
  cd "$pkgname-$pkgver"
  cmake . -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DWITH_RVV=OFF
  cmake --build . --config Release
}

check()
{
  cd "$pkgname-$pkgver"
  ctest --verbose --output-on-failure -C Release
}

package_zlib-ng()
{
  provides=(zlib libz.so)
  conflicts=(zlib)
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zlib/LICENSE"

  cd "$pkgdir"
  _pick_ zlib-ng-static usr/lib/libz.a
}

package_zlib-ng-static() {
  depends=(zlib-ng="$pkgver-$pkgrel")
  provides=(zlib-static)
  options=(!strip staticlibs)
  mv "$srcdir/pkgs/$pkgname"/* "$pkgdir"
}
