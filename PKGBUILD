# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fd
pkgver=10.5.0
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url=https://github.com/sharkdp/fd
license=('MIT' 'Apache-2.0')
makedepends=('rust')
source=("fd-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7c4503a48c135952846248c5cff1e7fb168f0591c3dde7711148eba2099af9b4848aa8c7b115922c105a80a54da4923fa3214cbf3d736f5641c8e14d0f957024')

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
