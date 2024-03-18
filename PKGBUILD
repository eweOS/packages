# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd
pkgver=0.9.0
pkgrel=10
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
            '403b7e5cf326a46278219a4951ae667b9d1abd58f9126a0cf71444cc243857ca'
            '571de25a9700c132b24194c8c75ddc0edef9599b02b89a8830c23b06a9d599ad'
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
  depends+=(pam_rundir)
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
