# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.11.0
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('dff01465aca54b1ffcbeac7164dd8e339318d2395f7a6c487b3ae9e8939152a7aad200cde676ff9b405210b987f20e97cbdf80140300e1b09864dd0b727dd375')


prepare()
{
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$RUSTHOST"
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
