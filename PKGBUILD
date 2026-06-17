# Maintainer: Eric Long <i@hack3r.moe>

pkgname=tinymist
pkgver=0.14.25
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='An integrated language service for Typst'
url='https://github.com/Myriad-Dreamin/tinymist'
license=(Apache-2.0)
depends=(musl llvm-libs openssl)
makedepends=(git rust)
source=("git+https://github.com/Myriad-Dreamin/tinymist.git#tag=v$pkgver")
sha256sums=('594106d8d8bb02a60730bcd0cbea9919251e7ad8bab783ac06d9752ccf70d3e0')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname
  export OPENSSL_NO_VENDOR=true
  export RUSTFLAGS+=" -Clink-arg=-flto=auto"

  # `--all-features` enables requires nodejs and yarn to provide some frontend
  # stuff, not needed since they are typically provided by IDE extensions.
  # However tinymist-assets/l10n may be useful, and could be enabled in the future.
  cargo build --frozen --release
}

check() {
  cd $pkgname
  export OPENSSL_NO_VENDOR=true
  export RUSTFLAGS+=" -Clink-arg=-flto=auto"
  export RUSTDOCFLAGS="$RUSTFLAGS"

  # set up E2E test according to scripts/e2e.sh, without rebuilding release
  mkdir -p editors/vscode/out/
  cp target/release/$pkgname editors/vscode/out/$pkgname

  cargo test --frozen
}

package() {
  cd $pkgname
  local _target=target/release/$pkgname
  install -Dm755 -t "$pkgdir"/usr/bin/ $_target
  install -Dm644 <($_target completion bash) "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 <($_target completion fish) "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  install -Dm644 <($_target completion zsh) "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  _install_license_ LICENSE
}
