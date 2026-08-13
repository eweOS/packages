# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=c3fmt
pkgver=0.3.2
pkgrel=1
pkgdesc='A customizable code formatter for the C3 language'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/lmichaudel/c3fmt
license=(MIT)
depends=(musl tree-sitter)
makedepends=(c3c)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(4acf2babaabc6518fcdae08f34201620024a3b4c6457a1bd3743a32cf585d51c)

build() {
  cd $pkgname-$pkgver
  c3c build
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin build/$pkgname
  _install_license_ LICENSE
}
