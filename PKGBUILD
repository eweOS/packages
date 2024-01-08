# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd
pkgver=0.9.0
pkgrel=9
pkgdesc="Generic greeter daemon"
arch=(x86_64 aarch64 riscv64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=(
  "$url/archive/$pkgver.tar.gz"
  greetd.pam
  greetd.service
  greetd.sysusers
)
sha256sums=('a0cec141dea7fd7838b60a52237692d0fd5a0169cf748b8f8379d8409a3768eb'
            '0a4645ab8f9128c3eaf078e6cdf781343e28b368b40c4d2e43f323a306e3f5be'
            '64cabfc14db189ab7887249d6a53e2053cd3093d2c95f5b8ee47e065d92d72d9'
            '703be69c0bfe1bba1815090113513a495f87198bfb46b02918634f56f5232fea')
depends=(pam)
optdepends=('dinit-userserv: user service auto-starting support')
makedepends=(rust)
options=(emptydirs)

build() {
  cd greetd-$pkgver
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/ -C target-feature=-crt-static" cargo build --release --locked
}

package() {
  # To provide initial XDG env
  depends+=(elogind)
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/greetd" \
    "$pkgdir/usr/bin/greetd"
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/agreety" \
    "$pkgdir/usr/bin/agreety"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"

  # wait-for.d
  install -d $pkgdir/usr/lib/dinit/system/greetd.d

  _dinit_install_services_ $srcdir/greetd.service
  _install_sysusers_ $srcdir/greetd.sysusers

  install -Dm644 "$srcdir/greetd-$pkgver/config.toml" \
    "$pkgdir/etc/greetd/config.toml"
}
