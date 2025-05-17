# Maintainer: Eric Long <i@hack3r.moe>

pkgname=tinymist
pkgver=0.13.12
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='An integrated language service for Typst'
url='https://github.com/Myriad-Dreamin/tinymist'
license=(Apache-2.0)
depends=(musl llvm-libs openssl)
makedepends=(git rust)
checkdepends=(cargo-insta)
source=("git+https://github.com/Myriad-Dreamin/tinymist.git#tag=v$pkgver")
sha256sums=('fb9a79b083ef80b6dc696aa7b288aca644b21c88f31a8156539ef271c606bf79')

pkgver() {
  # https://github.com/Myriad-Dreamin/tinymist#versioning-and-release-cycle
  if [[ $pkgver =~ ^.*[13579]$ ]]; then
    >&2 echo 'Odd-numbered releases target nightly typst, not stable.'
    exit 1
  else
    echo $pkgver
  fi
}

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  export OPENSSL_NO_VENDOR=true
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export OPENSSL_NO_VENDOR=true
  # E2E test requires some setup done in scripts/e2e.sh, so run it separately
  cargo test --frozen --all-features -- --skip e2e
  scripts/e2e.sh
}

package() {
  cd $pkgname-$pkgver
  local _target=target/release/$pkgname
  install -Dm755 -t "$pkgdir"/usr/bin/ $_target
  install -Dm644 <($_target completion bash) "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 <($_target completion fish) "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  install -Dm644 <($_target completion zsh) "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  _install_license_ LICENSE
}
