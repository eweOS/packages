# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=iw
pkgver=6.17
pkgrel=1
pkgdesc='Wireless configuration tool'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://wireless.wiki.kernel.org/en/users/documentation/iw
license=(ISC)
depends=(libnl musl)
makedepends=(linux-uapi-headers)
source=(https://git.kernel.org/pub/scm/linux/kernel/git/jberg/$pkgname.git/snapshot/$pkgname-$pkgver.tar.gz)
sha256sums=(7afc0f9f019ddd578fe85d70d4e269a0282960303648f2d56ca0ceb5774b7b1e)

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" SBINDIR=/usr/bin
  _install_license_ COPYING
}
