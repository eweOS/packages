# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=greetd
pkgname=(greetd greetd-agreety)
pkgver=0.10.3
pkgrel=6
pkgdesc="Generic greeter daemon"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=(
  "$url/archive/$pkgver.tar.gz"
  greetd.pam
  greetd.service
  greetd.sysusers
)
sha256sums=('ee5cb70e0add4ca9c9fe57e47581ab0002d44c07743fb5492469f3b570db640b'
            '6e184cd7e902d00d3679097310f7afe90da361a2a40bf4b148085cb84de98bd2'
            'a413aedea2ed6a24f6da43f1eeb357195559eb7f31d50c57e102801ebbfb1614'
            'a4c75d861abbea1ddca31b139859c03972a61820c6e65283110be90d0c11f596')
optdepends=('turnstile: user service and session manager support')
makedepends=(rust pam)
options=(emptydirs)

prepare() {
  cd greetd-$pkgver
  # we use vt 7 for graphical session
  sed -i 's/vt = 1/vt = 7/' config.toml
  sed -i 's@/bin/sh@/bin/bash@' config.toml

  # loongarch64 requires newer libc
  cargo update -p libc --precise 0.2.155
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd greetd-$pkgver
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/ -C target-feature=-crt-static" cargo build --release --locked
}

package_greetd() {
  depends+=(greetd-agreety pam)
  backup=("etc/greetd/config.toml" "etc/pam.d/greetd")

  install -Dm755 "$srcdir/greetd-$pkgver/target/release/greetd" \
    "$pkgdir/usr/bin/greetd"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"

  # wait-for.d
  install -d $pkgdir/usr/lib/dinit.d/greetd.d

  _dinit_install_services_ $srcdir/greetd.service
  _install_sysusers_ $srcdir/greetd.sysusers

  install -Dm644 "$srcdir/greetd-$pkgver/config.toml" \
    "$pkgdir/etc/greetd/config.toml"
}

package_greetd-agreety() {
  depends+=(greetd)

  install -Dm755 "$srcdir/greetd-$pkgver/target/release/agreety" \
    "$pkgdir/usr/bin/agreety"
}
