# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ghc
pkgver=9.4.8
pkgrel=1
pkgdesc='Glasgow Haskell Compiler.'
url='https://ghc.haskell.org/'
arch=(x86_64)		# NOTICE: we use ncg only
license=(BSD-3-Clause)
depends=(musl libffi gmp ncurses lld)
# missing: (alex happy python-sphinx)
makedepends=(python ghc cabal)
options=(!strip)
source=("https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-src.tar.xz"
	"fix-llvm-target-musl.patch")
sha256sums=('0bf407eb67fe3e3c24b0f4c8dea8cb63e07f63ca0f76cf2058565143507ab85e'
            'dd5f98dee96308fd8af621a3c782dea7541f196da0deded6b3866cc339bb9e38')

prepare() {
	cabal update
	cabal install alex happy

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
