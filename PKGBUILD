# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd-tui
pkgver=0.8.0
pkgrel=1
pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(greetd)
makedepends=(rust)
source=("tuigreet-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ed371ebe288a3e5782f01681c6c4ed4786b470184af286fa0e7b8898e47c154e')

build() {
  cd "tuigreet-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
}
