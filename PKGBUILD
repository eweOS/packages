# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=c3fmt
pkgver=0.3.5
pkgrel=1
pkgdesc='A customizable code formatter for the C3 language'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/lmichaudel/c3fmt
license=(MIT)
depends=(musl tree-sitter)
makedepends=(c3c)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('a16e32e2607dfb951df5e5b8e8241f4a5c837e2f7572c52433c5361c6f29fd2a')

build() {
  cd $pkgname-$pkgver
  c3c build
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin build/$pkgname
  _install_license_ LICENSE
}
