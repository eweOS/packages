# Maintainer: Eric Long <i@hack3r.moe>

pkgname=ripgrep
pkgver=14.1.1
pkgrel=1
_rust_pcre2_ver=0.2.9
pkgdesc='Recursively searches directories for a regex pattern while respecting your gitignore'
url=https://github.com/BurntSushi/ripgrep
license=('MIT OR Unlicense')
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=(git cargo rust)
depends=(musl llvm-libs pcre2)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "git+https://github.com/BurntSushi/rust-pcre2.git#tag=$_rust_pcre2_ver"
        pcre2-sys-musl-dynamic.patch)
sha256sums=('4dad02a2f9c8c3c8d89434e47337aa654cb0e2aa50e806589132f186bf5c2b66'
            '974611ff5d7be6d4a79695575ca07702126bd91012701f64b65c4be1d9c66a7d'
            'e6f3050e4dcd81a17332a6826c157c4e33dc1fdf02b6fe71aaa891b79783bbf7')

prepare() {
  cd rust-pcre2
  patch -Np1 -i ../pcre2-sys-musl-dynamic.patch

  cd "$srcdir"/$pkgname-$pkgver
  echo -e '\n[patch.crates-io]\npcre2-sys = { path = "../rust-pcre2/pcre2-sys" }' >> Cargo.toml
  cargo update -p pcre2-sys
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="-Clink-arg=-flto=auto"
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="-Clink-arg=-flto=auto"
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 target/release/rg "$pkgdir/usr/bin/rg"

  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  target/release/rg --generate complete-zsh > "$pkgdir/usr/share/zsh/site-functions/_rg"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  target/release/rg --generate complete-bash > "$pkgdir/usr/share/bash-completion/completions/rg"

  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  target/release/rg --generate complete-fish > "$pkgdir/usr/share/fish/vendor_completions.d/rg.fish"

  mkdir -p "$pkgdir/usr/share/man/man1"
  target/release/rg --generate man > "$pkgdir/usr/share/man/man1/rg.1"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  _install_license_ COPYING{,}
  _install_license_ LICENSE-MIT{,}
  _install_license_ UNLICENSE{,}
}
