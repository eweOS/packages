# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.9.6
pkgrel=0
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fcbdbbca85215a4276a1e8c79c3fd7fb8471fbae26639521cde96bc2c30128958d520a97312f33fdc13ce19fbd67c14c18cc5a4f2ecd743f390d69c1cbe5c640')


prepare()
{
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check()
{
  cd "$pkgname-$pkgver"
  CARGO_HUSKY_DONT_INSTALL_HOOKS=true cargo test --frozen --all-features
}

package()
{
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/btm
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
