# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.12.4
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gnupg.org/software/$pkgname"
license=(GPL-2.0-or-later LGPL-2.1-or-later GPL-3.0-or-later)
depends=('musl' 'libgpg-error')
source=("https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-$pkgver.tar.bz2")
sha256sums=('d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e')

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
