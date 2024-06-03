# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=greetd-tui
pkgver=0.9.1
pkgrel=1
pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
depends=(greetd)
makedepends=(rust)
source=("tuigreet-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('14fd1fadeb84040eb31901da2b53a48aa55b0fdaccb36d96fa52ce2d2113667f')

build() {
  cd "tuigreet-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
}
