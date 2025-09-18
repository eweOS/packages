# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swww
pkgver=0.11.0
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Horus645/swww"
license=('GPL-3.0-only')
depends=('lz4')
makedepends=('rust' 'scdoc' 'wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4853a4b0f846f8656063de6886d11c968cfd0d92ef3e8691c7ad4bd2be2a4436')
options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"
  # busybox does not support --suffix in basename
  sed -i 's/--suffix/-s/g' ./doc/gen.sh
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  
  ./doc/gen.sh
  find ./doc/generated/*.1 | xargs -I @ gzip -f "@"
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
  
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"
  install -vDm644 "completions/swww.elv" "$pkgdir/usr/share/elvish/lib/swww.elv"
  
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  
  cd ./doc/generated 
  ls *.1.gz | xargs -I @ install -Dm644 "@" "$pkgdir/usr/share/man/man1/@"
}
