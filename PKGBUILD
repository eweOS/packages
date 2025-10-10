# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=niri
pkgver=25.08
pkgrel=1
pkgdesc="A scrollable-tiling Wayland compositor"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  libdisplay-0-3-0.patch
)
sha512sums=('d8a10bb726d2e79f695544130cc9f55b1ac0f76dd9a9fb1cafb16cd7934b29a4fecf88656a3bc46ab6140aef7d2c58ed87f3ba43dfe8882df50de997283f2292'
            '963c6a020a93628a553c8656800bac75c43134b22d9f9219fe1ea561ffd0555c48d97d59039d3354210e289cf76a45d93a279a47669fd0239a78f9a8f63ef634')

prepare() {
  _patch_ "$pkgname-$pkgver"
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
  export XDG_RUNTIME_DIR=$srcdir/.xrd
  mkdir -p $srcdir/.xrd
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
