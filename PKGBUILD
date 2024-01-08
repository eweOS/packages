# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=ReGreet
pkgname=greetd-regreet
pkgver=0.1.1
pkgrel=1
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$pkgbase"
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
depends=(greetd gtk4)
makedepends=(rust git)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a658c91cdf242dfea814f0bfd0c4d877bd39e3af498d36e5024061e3d07ea76b')

prepare() {
  cd $pkgbase-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-musl"
}

build() {
  cd $pkgbase-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export GREETD_CONFIG_DIR="/etc/greetd"
  export CACHE_DIR="/var/cache/$pkgname"
  export LOG_DIR="/var/log/$pkgname"
  export SESSION_DIRS="/usr/share/wayland-sessions"
  cargo build --frozen --release --all-features --target-dir=target
}

package() {
  cd $pkgbase-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/regreet"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "regreet.sample.toml"
  install -Dm0644 "systemd-tmpfiles.conf" "$pkgdir/etc/tmpfiles.d/$pkgname.conf"
}
