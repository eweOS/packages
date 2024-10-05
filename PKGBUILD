# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=alex
pkgver=3.5.1.0
pkgrel=1
pkgdesc='A tool for generating lexical analysers in Haskell'
url='https://hackage.haskell.org/package/alex'
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
depends=(libffi gmp zlib-ng)
makedepends=(cabal ghc)
source=("https://hackage.haskell.org/package/alex-$pkgver/alex-$pkgver.tar.gz")
sha256sums=('c92efe86f8eb959ee03be6c04ee57ebc7e4abc75a6c4b26551215d7443e92a07')

build () {
	cd "$pkgname-$pkgver"
	runhaskell Setup.hs configure \
		--prefix=/usr				\
		--datasubdir="$pkgname"			\
		--docdir="\$datadir/doc/$pkgname"	\
		--enable-tests
	runhaskell Setup.hs build -j"$JOBS"
}

check() {
	cd "$pkgname-$pkgver"
	runhaskell Setup.hs test
}

package() {
	cd "$pkgname-$pkgver"
	runhaskell Setup.hs copy --destdir="$pkgdir"
}
