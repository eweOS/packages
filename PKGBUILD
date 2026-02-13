# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=zlib-ng
pkgname=(zlib-ng zlib-ng-static)
pkgver=2.3.3
pkgrel=2
pkgdesc='zlib data compression library for the next generation systems'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Zlib)
url="https://github.com/zlib-ng/zlib-ng"
depends=(musl)
makedepends=(cmake googletest)
source=($pkgname-$pkgver.tar.gz::"https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1')

prepare() {
  cd "$pkgname-$pkgver"
  grep -A 24 '^  Copyright' zlib.h.in > LICENSE
}

build() {
  cd "$pkgname-$pkgver"
  cmake . -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build . --config Release
}

check() {
  cd "$pkgname-$pkgver"
  ctest --verbose --output-on-failure -C Release
}

package_zlib-ng() {
  provides=(zlib libz.so)
  conflicts=(zlib)
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  _install_license_ LICENSE

  cd "$pkgdir"
  _pick_ zlib-ng-static usr/lib/libz.a
}

package_zlib-ng-static() {
  depends=(zlib-ng="$pkgver-$pkgrel")
  provides=(zlib-static)
  options=(!strip staticlibs)
  mv "$srcdir/pkgs/$pkgname"/* "$pkgdir"
}
