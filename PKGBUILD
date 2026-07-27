# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=alacritty
pkgver=0.17.0
pkgrel=1
pkgdesc='A fast, cross-platform, OpenGL terminal emulator'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://alacritty.org
license=(Apache-2.0 MIT)
depends=(fontconfig freetype2 musl libglvnd libxkbcommon llvm-libs wayland)
makedepends=(cargo desktop-file-utils scdoc)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(38d6527d346cda5c6049332a1f3338a89ea66cd7981b54d4c3ce801b392496f8)

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --target $RUSTHOST --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --features wayland --no-default-features --release --frozen
}

check() {
  cd $pkgname-$pkgver
  cargo test --features wayland --no-default-features --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  _install_license_ LICENSE-APACHE LICENSE-APACHE
  _install_license_ LICENSE-MIT LICENSE-MIT

  cd extra
  desktop-file-install --dir "$pkgdir"/usr/share/applications linux/Alacritty.desktop

  install -Dm644 -t "$pkgdir"/usr/share/metainfo linux/org.$pkgname.Alacritty.appdata.xml
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps logo/compat/$pkgname-term.svg

  install -Dm644 completions/$pkgname.bash "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/zsh/site-functions completions/_$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/fish/vendor_completions.d completions/$pkgname.fish

  scdoc < man/$pkgname.1.scd | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man1/$pkgname.1
  scdoc < man/$pkgname.5.scd | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man5/$pkgname.5
  scdoc < man/$pkgname-msg.1.scd | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man1/$pkgname-msg.1
  scdoc < man/$pkgname-bindings.5.scd | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man5/$pkgname-bindings.5
  scdoc < man/$pkgname-escapes.7.scd | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man7/$pkgname-escapes.7
}
