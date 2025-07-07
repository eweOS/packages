# Maintainer : Yukari Chiba <i@0x7f.cc>

pkgname=rust-bindgen
_pkgname=bindgen
pkgver=0.72.0
pkgrel=1
pkgdesc='Automatically generates Rust FFI bindings to C (and some C++) libraries'
url='https://github.com/rust-lang/rust-bindgen'
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-lang/rust-bindgen/archive/v$pkgver.tar.gz")
sha512sums=('606bcf2bb087cfc16dbc28f47515684cb7cc0fa2bae624c789d6aa54e873d9b8970de020c8f19d5952a2263675a39bce91132a66dbfcb44bf3520ad86682d8f8')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
  mkdir -p completions
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --frozen
  local _completion="target/release/$_pkgname --generate-shell-completions"
  $_completion bash >"completions/$_pkgname"
  $_completion fish >"completions/$_pkgname.fish"
  $_completion zsh >"completions/_$_pkgname"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$_pkgname" "$pkgdir"/usr/bin/bindgen
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm664 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm664 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
