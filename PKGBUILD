# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=eww
pkgver=0.6.0
pkgrel=1
pkgdesc="A standalone widget system for wayland made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(rust git)
depends=(gtk3 gtk-layer-shell libdbusmenu-glib libdbusmenu-gtk3)
source=("git+$url#tag=v$pkgver")
sha256sums=('b750ade5e2f20f348c775374410480b7b6368d8246984f86da49067a34e21c2b')

prepare() {
  cd $pkgname
  cargo update --precise 0.3.36 time@0.3.34
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --package eww --no-default-features --features wayland
}

package() {
  cd $pkgname
  install -Dm755 target/release/eww "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
