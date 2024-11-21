# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=niri
pkgver=0.1.10.1
pkgrel=1
pkgdesc="A scrollable-tiling Wayland compositor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/YaLTeR/niri"
license=(GPL-3.0-or-later)
depends=(
  cairo
  glib2
  libdisplay-info
  libinput
  libpipewire
  libxkbcommon
  mesa
  pango
  pixman
  seatd
  xdg-desktop-portal-impl
)
makedepends=(
  rust
)
optdepends=(
  'alacritty: a suggested GPU-accelerated terminal emulator'
  'bash: for niri-session script'
  'fuzzel: a suggested Wayland application launcher'
  'mako: a suggested Wayland notification daemon'
  'org.freedesktop.secrets: for apps to rely on secrets portal'
  'swaybg: a suggested Wayland wallpaper tool'
  'waybar: a suggested Wayland customizable desktop bar'
  'waylock: a suggested Wayland screen locker'
  'xdg-desktop-portal-gtk: a suggested XDG desktop portal'
  'xdg-desktop-portal-gnome: a XDG desktop portal required for screencasting'
)
# NOTE: linking issues with LTO enabled
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ba816350bad30debcb961d6c516c96a0a732621e78e08f7f04bbf3bee46cb463318a59acf532660288022a247cfcd636d59159b66fd01c1c702d58f8ddf44e6a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features --features "dbus,dinit,xdp-gnome-screencast"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all --exclude niri-visual-tests --frozen --no-default-features --features "dbus,dinit,xdp-gnome-screencast"
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -vDm 755 "resources/$pkgname-session" -t "$pkgdir/usr/bin/"
  install -vDm 644 "resources/$pkgname.desktop" -t "$pkgdir/usr/share/wayland-sessions/"
  install -vDm 644 "resources/$pkgname-portals.conf" -t "$pkgdir/usr/share/xdg-desktop-portal/"
  install -vDm 644 "resources/default-config.kdl" README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
