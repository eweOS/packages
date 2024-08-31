# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ntbtls
pkgver=0.3.2
pkgrel=1
pkgdesc='Not Too Bad TLS library'
url='https://wiki.gnupg.org/NTBTLS'
arch=(x86_64 aarch64 riscv64)
license=(GPL-3.0-or-later)
depends=(musl libgcrypt libgpg-error libksba)
provides=(libntbtls.so)
source=("git+https://dev.gnupg.org/source/ntbtls.git#tag=ntbtls-$pkgver")
sha256sums=('ad9e26099d5332558e08e6e75c9054349015d54c0695aabfa6d6720254dfd7e9')

build () {
	cd "$pkgname"

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"

	make check
}

package() {
	cd "$pkgname"

	make install DESTDIR="$pkgdir"
}
