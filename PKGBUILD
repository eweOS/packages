# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=texinfo
pkgver=7.3
pkgrel=1
pkgdesc='GNU documentation system for on-line information and printed output'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnu.org/software/texinfo/'
license=(GPL-3.0-or-later)
depends=(ncurses perl sh musl)
source=("https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('51f74eb0f51cfa9873b85264dfdd5d46e8957ec95b88f0fb762f63d9e164c72e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr \
		--enable-perl-xs
	make
}

check() {
	make -C "$pkgname-$pkgver" check
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
	rm -f "$pkgdir"/usr/share/info/dir
	gzip "$pkgdir"/usr/share/info/*
}
