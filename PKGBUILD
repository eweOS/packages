# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.10.3
pkgrel=2
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64 riscv64)
url="https://gnupg.org/software/$pkgname"
license=(LGPLv2 GPLv2)
source=("http://www.ring.gr.jp/pub/net/gnupg/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa')

depends=('musl' 'libgpg-error')

prepare() {
  cd $pkgname-$pkgver
  # tests fail due to systemd+libseccomp preventing memory syscalls when building in chroots
  sed -i "s:t-secmem::" tests/Makefile.am
  sed -i "s:t-sexp::" tests/Makefile.am
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
