# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swww
pkgver=0.9.4
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('lz4' 'libxkbcommon')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87359135c6930776b6266fe611a97001fca5909bfb999aed0f9036f07533adf7')
options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"
  # busybox does not support --suffix in basename
  sed -i 's/--suffix/-s/g' ./doc/gen.sh
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release 
  
  ./doc/gen.sh
  find ./doc/generated/*.1 | xargs -I @ gzip -f "@"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
  
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"
  
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  
  cd ./doc/generated 
  ls *.1.gz | xargs -I @ install -Dm644 "@" "$pkgdir/usr/share/man/man1/@"
}
