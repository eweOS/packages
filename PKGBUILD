# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.14.4
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7dcbf50b8e6330b6c7c863f6e3875cb6d8bfca4a0661378c1837bd8dc91d13cd166976b60786ffb48411d9d631c861fe72c490cc98d762c4155bb30bc925b98d')


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
