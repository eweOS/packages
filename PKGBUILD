# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fd
pkgver=10.5.2
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url=https://github.com/sharkdp/fd
license=('MIT' 'Apache-2.0')
makedepends=('rust')
source=("fd-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('323ea5515e06e15e6ee0175e8baac57a352795334886e9f03daf1cbb103d2b5cafebaa1a36428c00a265598d4286d75ab43b0be3091a755a35841fcf15e6f66b')

prepare() {
  cd fd-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd fd-$pkgver
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release --locked --offline
}

check() {
  cd fd-$pkgver
  cargo test --locked --offline
}

package() {
  cd fd-$pkgver
  install -Dm755 target/release/fd "$pkgdir"/usr/bin/fd

  make completions
  install -Dm644 autocomplete/fd.bash "$pkgdir"/usr/share/bash-completion/completions/fd
  install -Dm644 autocomplete/fd.fish "$pkgdir"/usr/share/fish/vendor_completions.d/fd.fish
  install -Dm644 autocomplete/_fd "$pkgdir"/usr/share/zsh/site-functions/_fd

  install -Dm644 doc/fd.1 "$pkgdir"/usr/share/man/man1/fd.1
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/fd/LICENSE-MIT
}
