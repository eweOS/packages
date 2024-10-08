# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=neovim
pkgver=0.10.2
pkgrel=1
pkgdesc='hyperextensible Vim-based text editor'
url='https://neovim.io'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0 Vim)
depends=(lua51
	 gettext
	 gperf
	 libtermkey
 	 libvterm
 	 libuv
	 libluv
	 lua51-bitop
	 lua51-luv
	 lua51-lpeg
 	 lua51-mpack
	 msgpack-c
	 samurai
	 tree-sitter
	 unibilium)
makedepends=(cmake samurai)
source=("https://github.com/neovim/neovim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('546cb2da9fffbb7e913261344bbf4cf1622721f6c5a67aa77609e976e78b8e89')

build () {
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_INSTALL_LIBDIR=lib	\
		-DENABLE_JEMALLOC=OFF		\
		-DENABLE_LTO=ON			\
		-DCMAKE_VERBOSE_MAKEFILE=ON	\
		-DCI_BUILD=OFF			\
		-DPREFER_LUA=ON			\
		neovim-$pkgver
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ neovim-$pkgver/LICENSE.txt
}
