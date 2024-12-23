# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=ReGreet
pkgname=greetd-regreet
pkgver=0.1.2
pkgrel=1
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$_pkgbase"
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(greetd gtk4)
makedepends=(rust git)
source=("$url/archive/refs/tags/$pkgver.tar.gz" regreet.toml login.defs)
sha256sums=('7358f5536d1fbbf36e0d9ba152a393d85d733ea5946bdc0c720f460de2c5e8e4'
            '9d9f2cc91d124e1c4a995d0c99dfa67fda7fa98b6b9ab972c18e6c36dd3de7d2'
            '836ee891c94641892de432c4107ffa3e5cafc0c13a1d341638b914de880d2bd3')

prepare() {
  cd $_pkgbase-$pkgver

  cargo update --precise 0.2.162 libc@0.2.155

  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $_pkgbase-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export GREETD_CONFIG_DIR="/etc/greetd"
  export CACHE_DIR="/var/cache/regreet"
  export LOG_DIR="/var/log/regreet"
  export SESSION_DIRS="/usr/share/wayland-sessions"
  cargo build --frozen --release --all-features --target-dir=target
}

package() {
  cd $_pkgbase-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/regreet"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "regreet.sample.toml"
  install -Dm0644 -t "$pkgdir/etc/greetd/" $srcdir/regreet.toml
  install -Dm0644 "systemd-tmpfiles.conf" "$pkgdir/etc/tmpfiles.d/$pkgname.conf"
  install -Dm0644 -t "$pkgdir/etc/" $srcdir/login.defs
}
