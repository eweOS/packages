# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=samurai
pkgver=1.3
pkgrel=1
pkgdesc='a ninja-compatible build tool written in C99'
url='https://github.com/michaelforney/samurai/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl)
source=("https://github.com/michaelforney/samurai/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('44ff119a27b343ec47a797fa8701c19b9e672230bc15f3c6a6cede9641ea6332')

build () {
  cd samurai-$pkgver
  make
}

package() {
  cd samurai-$pkgver
  make install DESTDIR=${pkgdir} PREFIX=/usr
  _install_license_ LICENSE
}
