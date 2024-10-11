# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tree-sitter
pkgver=0.24.3
pkgrel=1
pkgdesc='An incremental parsing system for programming tools '
url='https://github.com/tree-sitter/tree-sitter'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
provides=(libtree-sitter.so)
source=("https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a8d0cf8e09caba22ed0d8439f7fa1e3d8453800038e43ccad1f34ef29537da1')

build () {
	cd tree-sitter-$pkgver
	make
}

package() {
	cd tree-sitter-$pkgver
	make install PREFIX=/usr DESTDIR=$pkgdir
	_install_license_ LICENSE
}
