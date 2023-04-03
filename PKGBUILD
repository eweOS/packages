# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.8.0
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1595d74b086338ce740e53468ec627b5dd52ebaa49e490f2363dffcdd3b3b7d1f2c3ae357ff40ddfc79e0454bb280bf629566ab8c5f2f297688165d7d4478c99')

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

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/btm

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # completions
  local target_dir=$(ls target/release/build/bottom-*/out/btm.bash | head -n1 | xargs dirname)
  install -Dm644 "$target_dir"/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
  install -Dm644 "$target_dir"/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
  install -Dm644 "$target_dir"/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
