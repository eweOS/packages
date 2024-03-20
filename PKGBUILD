# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=samurai
pkgver=1.2
pkgrel=3
pkgdesc='a ninja-compatible build tool written in C99'
url='https://github.com/michaelforney/samurai/'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(musl)
source=("https://github.com/michaelforney/samurai/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('37a2d9f35f338c53387eba210bab7e5d8abe033492664984704ad84f91b71bac')

build () {
  cd samurai-$pkgver
  make
}

package() {
  conflicts+=(ninja)

  cd samurai-$pkgver
  make install DESTDIR=${pkgdir} PREFIX=/usr
  ln -s samu $pkgdir/usr/bin/ninja
  _install_license_ LICENSE
}
