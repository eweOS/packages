# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tree-sitter
pkgver=0.24.6
pkgrel=1
pkgdesc='An incremental parsing system for programming tools '
url='https://github.com/tree-sitter/tree-sitter'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
provides=(libtree-sitter.so)
source=("https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03c7ee1e6f9f4f3821fd4af0ae06e1da60433b304a73ff92ee9694933009121a')

build () {
	cd tree-sitter-$pkgver
	make
}

package() {
	cd tree-sitter-$pkgver
	make install PREFIX=/usr DESTDIR=$pkgdir
	_install_license_ LICENSE
}
