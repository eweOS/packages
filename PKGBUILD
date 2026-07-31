# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=iucode-tool
pkgver=2.3.1
pkgrel=1
pkgdesc='Tool to manipulate Intel® IA-32/X86-64 microcode bundles'
arch=(x86_64)
url=https://gitlab.com/iucode-tool/iucode-tool/-/wikis/home
license=(GPL-2.0-or-later)
depends=(libuargp musl)
source=(https://gitlab.com/$pkgname/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=(e24951098b5753293e43689bd8e0a61c4fd2e68870672d20bb89b093dfd8b255)

prepare() {
  cd $pkgname-v$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix /usr --sbindir /usr/bin
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
