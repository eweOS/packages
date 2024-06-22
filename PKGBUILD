# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.11.0
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64 riscv64)
url="https://gnupg.org/software/$pkgname"
license=(GPL-2.0-or-later LGPL-2.1-or-later GPL-3.0-or-later)
depends=('musl' 'libgpg-error')
source=("http://www.ring.gr.jp/pub/net/gnupg/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

check() {
  cd $pkgname-$pkgver
  make check
}
