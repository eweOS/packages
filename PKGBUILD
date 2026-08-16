# Maintainer: Eric Long <i@hack3r.moe>

pkgname=atuin
pkgver=18.19.0
pkgrel=1
pkgdesc="Magical shell history"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://atuin.sh"
license=(MIT)
depends=(musl llvm-libs sqlite)
makedepends=(rust)
optdepends=('blesh: bash integration')
source=("https://github.com/atuinsh/atuin/archive/v$pkgver/atuin-$pkgver.tar.gz")
sha256sums=('fdb8268cdd5b13105db79e821f06c1c6624e0c5aee46befb0491e39af42fd4e6')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo build --release --frozen --all-features
  mkdir completions/
  for sh in bash fish zsh; do
    target/release/$pkgname gen-completions -s $sh -o completions/
  done
}

check() {
  cd $pkgname-$pkgver
  # skipping atuin sync tests in binary crates, as atuin sync is an online
  # feature whose test requires complicated server deployment
  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo test --frozen --all-features --lib
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 completions/$pkgname.bash "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 completions/$pkgname.fish -t "$pkgdir"/usr/share/fish/vendor_completions.d
  install -Dm644 completions/_$pkgname -t "$pkgdir"/usr/share/zsh/site-functions
  _install_license_ LICENSE
}
