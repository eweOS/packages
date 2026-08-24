# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tree-sitter
pkgver=0.26.13
pkgrel=1
pkgdesc='An incremental parsing system for programming tools '
url='https://github.com/tree-sitter/tree-sitter'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
provides=(libtree-sitter.so)
source=("https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ece24c3c5e2a76384075e830c7139b59fce8fb01e4ef8436fab08bbe10444c89')

build () {
	cd tree-sitter-$pkgver
	make
}

package() {
	cd tree-sitter-$pkgver
	make install PREFIX=/usr DESTDIR=$pkgdir
	_install_license_ LICENSE
}
