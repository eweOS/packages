# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ghc
pkgver=9.6.7
pkgrel=1
pkgdesc='Glasgow Haskell Compiler.'
url='https://ghc.haskell.org/'
arch=(x86_64 aarch64)		# NOTICE: we use NCG only
license=(BSD-3-Clause)
depends=(musl libffi gmp ncurses lld)
# missing python-sphinx
makedepends=(python ghc cabal alex happy)
options=(!strip)
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-src.tar.xz"
	"fix-llvm-target-musl.patch")
sha256sums=('d053bf6ce1d588a75cfe8c9316269486e9d8fb89dcdf6fd92836fa2e3df61305'
            'dd5f98dee96308fd8af621a3c782dea7541f196da0deded6b3866cc339bb9e38')

prepare() {
	cabal update

	_patch_ ghc-$pkgver
	cd ghc-$pkgver
	autoreconf -iv
}

build () {
	cd ghc-$pkgver
	./configure --with-system-libffi

	./hadrian/build-cabal -j$JOBS \
		--docs=none		\
		--flavour=release	\
		binary-dist-dir
}


# skip checks for now
# check() {
# 	cd ghc-$pkgver
# }

package() {
	cd ghc-$pkgver/_build/bindist/ghc-$pkgver-*/

	./configure --prefix=/usr
	make install DESTDIR=$pkgdir

	# TODO: strip the compiler
}
