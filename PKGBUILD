# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd-tui
pkgver=0.9.0
pkgrel=1
pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
depends=(greetd)
makedepends=(rust)
source=("tuigreet-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('721254c3173d3f5cd360d1ddb2d57139022f2d75d561818fad68d01f89bc5ce3')

build() {
  cd "tuigreet-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
}
