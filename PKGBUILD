# Maintainer: Eric Long <i@hack3r.moe>

pkgname=ripgrep
pkgver=15.2.0
pkgrel=3
pkgdesc='Recursively searches directories for a regex pattern while respecting your gitignore'
url=https://github.com/BurntSushi/ripgrep
license=('MIT OR Unlicense')
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=(git cargo rust)
depends=(musl mimalloc llvm-libs pcre2)
# no-jemalloc: Downstream, disable tikv-jemallocator dependency on musl which
#	takes jemalloc as backend.
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        no-jemalloc.patch)
sha256sums=('7605249d3eb0d5f170e3414498e3344e26b1e7a147aec518b57090b80036a562'
            'bfa2ec9ef8b41f9ee901b7a4e6b2963c4cda205f4c203528aeec3595942ae8eb')

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  cargo update -p tikv-jemallocator
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-flto=auto"
  export LDFLAGS="$LDFLAGS -lmimalloc"
  export PCRE2_SYS_STATIC=0
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-flto=auto"
  export LDFLAGS="$LDFLAGS -lmimalloc"
  export PCRE2_SYS_STATIC=0
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
