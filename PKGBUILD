# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=ReGreet
pkgname=greetd-regreet
pkgver=0.1.1
pkgrel=4
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$pkgbase"
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
depends=(greetd gtk4)
makedepends=(rust git)
source=("$url/archive/refs/tags/$pkgver.tar.gz" regreet.toml login.defs)
sha256sums=('a658c91cdf242dfea814f0bfd0c4d877bd39e3af498d36e5024061e3d07ea76b'
            '9d9f2cc91d124e1c4a995d0c99dfa67fda7fa98b6b9ab972c18e6c36dd3de7d2'
            '836ee891c94641892de432c4107ffa3e5cafc0c13a1d341638b914de880d2bd3')

prepare() {
  cd $pkgbase-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $pkgbase-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export GREETD_CONFIG_DIR="/etc/greetd"
  export CACHE_DIR="/var/cache/regreet"
  export LOG_DIR="/var/log/regreet"
  export SESSION_DIRS="/usr/share/wayland-sessions"
  cargo build --frozen --release --all-features --target-dir=target
}

package() {
  cd $pkgbase-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/regreet"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "regreet.sample.toml"
  install -Dm0644 -t "$pkgdir/etc/greetd/" $srcdir/regreet.toml
  install -Dm0644 "systemd-tmpfiles.conf" "$pkgdir/etc/tmpfiles.d/$pkgname.conf"
  install -Dm0644 -t "$pkgdir/etc/" $srcdir/login.defs
}
