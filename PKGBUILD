# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.11.1
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gnupg.org/software/$pkgname"
license=(GPL-2.0-or-later LGPL-2.1-or-later GPL-3.0-or-later)
depends=('musl' 'libgpg-error')
source=("http://www.ring.gr.jp/pub/net/gnupg/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e')

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
