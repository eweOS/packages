# Maintainer : Yukari Chiba <i@0x7f.cc>

pkgname=rust-bindgen
_pkgname=bindgen
pkgver=0.72.1
pkgrel=2
pkgdesc='Automatically generates Rust FFI bindings to C (and some C++) libraries'
url='https://github.com/rust-lang/rust-bindgen'
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-lang/rust-bindgen/archive/tags/v$pkgver.tar.gz")
sha512sums=('8e280138fae9c50ddbf56b7d366f3007cdf805a0055574222c8078a56390a6950b9b15fce634dbbf301c81bd6e9ccf448239ac2671852878898715787c32991d')

prepare() {
  cd $pkgname-tags-v$pkgver
  cargo fetch --locked --target "$RUSTHOST"
  mkdir -p completions
}

build() {
  cd $pkgname-tags-v$pkgver
  cargo build --release --frozen
  local _completion="target/release/$_pkgname --generate-shell-completions"
  $_completion bash >"completions/$_pkgname"
  $_completion fish >"completions/$_pkgname.fish"
  $_completion zsh >"completions/_$_pkgname"
}

check() {
  cd $pkgname-tags-v$pkgver
  # test_wrap_static_fns fails on aarch64, this is an upstream issue
  # https://github.com/rust-lang/rust-bindgen/issues/3234
  cargo test --release --frozen -- --skip test_wrap_static_fns
}

package() {
  cd $pkgname-tags-v$pkgver
  install -Dm755 "target/release/$_pkgname" "$pkgdir"/usr/bin/bindgen
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm664 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm664 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
