# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd
pkgver=0.8.0
pkgrel=3
pkgdesc="Generic greeter daemon"
arch=(x86_64 aarch64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=(
  "$url/archive/$pkgver.tar.gz"
  greetd.pam
  greetd.service
  greetd.sysusers
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
depends=(pam)
makedepends=(rust)

build() {
  cd greetd-$pkgver
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/ -C target-feature=-crt-static" cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/greetd" \
    "$pkgdir/usr/bin/greetd"
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/agreety" \
    "$pkgdir/usr/bin/agreety"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"
  install -Dm644 "$srcdir/greetd.service" \
    "$pkgdir/etc/dinit.d/greetd"
  install -Dm644 "$srcdir/greetd.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/greetd.conf"

  install -Dm644 "$srcdir/greetd-$pkgver/config.toml" \
    "$pkgdir/etc/greetd/config.toml"
}
