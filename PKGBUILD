# Maintainer: Eric Long <i@hack3r.moe>

pkgname=atuin
pkgver=18.25.1
pkgrel=1
pkgdesc="Magical shell history"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://atuin.sh"
license=(MIT)
depends=(musl llvm-libs sqlite openssl)
checkdepends=(git tzdata)
makedepends=(rust)
optdepends=('blesh: bash integration')
source=("https://github.com/atuinsh/atuin/archive/v$pkgver/atuin-$pkgver.tar.gz")
sha256sums=('44e3376136fc5786868121955adabc824ea7f2e5e0e51345a95100b3bd6d4c91')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo build --release --frozen
  mkdir completions/
  for sh in bash fish zsh; do
    target/release/$pkgname gen-completions -s $sh -o completions/
  done
}

check() {
  cd $pkgname-$pkgver
  # Sync tests need a deployed server.
  # Limit parallelism: the capture-lock test uses 200 ms timeouts.
  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo test --frozen --lib -- --test-threads=4
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
