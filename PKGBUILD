# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=bottom
pkgver=0.14.6
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8565d3c9c7c6465291283b62f73c2fb2d9f28f3824a312dc769f75c483ed8035d7dea06187d867b1e32c45ca89605c9811c046a2b6842c19ea876797e6f18867')

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
