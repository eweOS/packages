# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd-tui
pkgver=0.11.0
pkgrel=1
pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(greetd)
makedepends=(rust)
source=("tuigreet-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5f18485979be009512b60b303c7136f8ef2901091ed00edd4f3d61d871c51368')

prepare() {
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
