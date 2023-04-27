# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd
pkgver=0.9.0
pkgrel=4
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
sha256sums=('a0cec141dea7fd7838b60a52237692d0fd5a0169cf748b8f8379d8409a3768eb'
            '499ae517100eae6ff80b0b14791854cd628a4c4e91214620a831d853270e6e97'
            '0147b0e8908c53b36a81e465cddef8bcfacd63c3dfbbfa2c889986b031ea560a'
            '703be69c0bfe1bba1815090113513a495f87198bfb46b02918634f56f5232fea')
depends=(pam)
makedepends=(rust)

build() {
  cd greetd-$pkgver
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/ -C target-feature=-crt-static" cargo build --release --locked
}

package() {
  # To provide XDG_RUNTIME_DIR
  depends+=(pam_rundir)
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
