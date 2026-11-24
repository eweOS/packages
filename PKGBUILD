# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd-tui
pkgver=0.11.1
pkgrel=2
pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(greetd)
makedepends=(rust)
# 0001: Backport, replace archived utmp-rs with utmpx
# https://github.com/tuigreet/tuigreet/pull/258
source=(
  "tuigreet-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-replace-utmp-rs-with-utmpx.patch"
)
sha256sums=('7d643ba224c40c6a63f9462a826630543071aea08e732ccd2e880bcd80d939e8'
            '3f811c141ea8f9da20ebc53a4b851760a6b6329a297ee2524abd34a9c9238057')

prepare() {
  _patch_ "tuigreet-$pkgver"
  cd "tuigreet-$pkgver"
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd "tuigreet-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
}
