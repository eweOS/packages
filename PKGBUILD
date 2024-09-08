# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=texinfo
pkgver=7.1.1
pkgrel=1
pkgdesc='GNU documentation system for on-line information and printed output'
arch=(x86_64 aarch64 riscv64)
url='https://www.gnu.org/software/texinfo/'
license=(GPL-3.0-or-later)
depends=(ncurses perl sh musl)
source=("https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('31ae37e46283529432b61bee1ce01ed0090d599e606fc6a29dca1f77c76a6c82')

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
