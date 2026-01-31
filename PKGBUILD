# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=neovim
pkgver=0.11.6
pkgrel=1
pkgdesc='hyperextensible Vim-based text editor'
url='https://neovim.io'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 Vim)
depends=(lua51
	 gettext
	 gperf
	 libtermkey
 	 libvterm
	 libutf8proc
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
sha256sums=('d1c8e3f484ed1e231fd5f48f53b7345b628e52263d5eef489bb8b73ca8d90fca')

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
