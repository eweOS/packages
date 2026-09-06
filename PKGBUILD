# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=Catch2
pkgbase=catch2
pkgname=(catch2{,-doc})
pkgver=2.13.10
pkgrel=1
pkgdesc='A modern, C++-native, test framework for unit-tests, TDD and BDD'
arch=(any)
url=https://github.com/catchorg/Catch2
license=(BSL-1.0)
depends=(llvm-libs musl)
makedepends=(cmake python)
source=($basename-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(d54a712b7b1d7708bc7a819a8e6e47b2fde9536f487b89ccbca295072a7d9943)

build() {
  cmake -S $_name-$pkgver -B build -D CMAKE_INSTALL_PREFIX=/usr
}

package_catch2() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $_name-$pkgver/LICENSE.txt

  cd "$pkgdir"
  _pick_ doc usr/share/doc
}

package_catch2-doc() {
  pkgdesc+=' (Documentation)'
  depends=()

  cp -r pkgs/doc/usr "$pkgdir"
}
