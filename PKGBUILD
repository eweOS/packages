# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tree-sitter
pkgver=0.23.0
pkgrel=1
pkgdesc='An incremental parsing system for programming tools '
url='https://github.com/tree-sitter/tree-sitter'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
provides=(libtree-sitter.so)
source=("https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6403b361b0014999e96f61b9c84d6950d42f0c7d6e806be79382e0232e48a11b')

build () {
	cd tree-sitter-$pkgver
	make
}

package() {
	cd tree-sitter-$pkgver
	make install PREFIX=/usr DESTDIR=$pkgdir
	_install_license_ LICENSE
}
