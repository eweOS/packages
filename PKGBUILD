# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.9.7
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1a34f1b4096ccea514c2edfaef536b81c2be2ca9a7dc3a27f79cb00633187f9afc2aef73b0e37ad85d44d5435c1361a72f6a289cad497b9f1e5ccda0a71aa172')


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
