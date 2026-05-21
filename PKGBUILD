# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=steponmine
pkgver=0.0.1
pkgrel=2
pkgdesc='A simple TUI-based minesweeper game'
url='https://github.com/ziyao233/steponmine'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl ncurses)
source=("https://github.com/ziyao233/steponmine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fcb47a62236aaed25450e6ab8ec435edda91dcb39b77df4cef2274967bae3312')

build() {
	c99 $CFLAGS $LDFLAGS steponmine-"$pkgver"/steponmine.c -o steponmine \
		$(pkg-config --cflags --libs ncurses)
}

package() {
	install -Dm755 steponmine "$pkgdir"/usr/bin/steponmine
}
