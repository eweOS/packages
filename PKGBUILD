# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=zlib-ng
pkgver=2.0.6
pkgrel=2
pkgdesc='zlib data compression library for the next generation systems'
arch=(x86_64 aarch64 riscv64)
license=('custom')
url="https://github.com/zlib-ng/zlib-ng"
depends=(musl)
makedepends=(cmake)
provides=(zlib)
conflicts=(zlib)
source=($pkgname-$pkgver::"https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8258b75a72303b661a238047cb348203d88d9dddf85d480ed885f375916fcab6')

prepare()
{
  cd "$pkgname-$pkgver"
  # busybox gz doesn't support --decompress
  sed -i 's/--decompress/-d/g' cmake/test-compress.cmake
  grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build()
{
  cd "$pkgname-$pkgver"
  cmake . -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX=/usr
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
