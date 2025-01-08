# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=texinfo
pkgver=7.2
pkgrel=1
pkgdesc='GNU documentation system for on-line information and printed output'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnu.org/software/texinfo/'
license=(GPL-3.0-or-later)
depends=(ncurses perl sh musl)
source=("https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('0329d7788fbef113fa82cb80889ca197a344ce0df7646fe000974c5d714363a6')

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
