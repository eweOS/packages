# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tree-sitter
pkgver=0.25.3
pkgrel=1
pkgdesc='An incremental parsing system for programming tools '
url='https://github.com/tree-sitter/tree-sitter'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
provides=(libtree-sitter.so)
source=("https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('862fac52653bc7bc9d2cd0630483e6bdf3d02bcd23da956ca32663c4798a93e3')

build () {
	cd tree-sitter-$pkgver
	make
}

package() {
	cd tree-sitter-$pkgver
	make install PREFIX=/usr DESTDIR=$pkgdir
	_install_license_ LICENSE
}
