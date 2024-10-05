# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=happy
pkgver=1.20.1.1
pkgrel=1
pkgdesc='The Happy parser generator for Haskell'
url='https://hackage.haskell.org/package/happy'
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
depends=(libffi gmp zlib-ng)
makedepends=(cabal ghc)
source=("https://hackage.haskell.org/package/happy-1.20.1.1/happy-1.20.1.1.tar.gz")
sha256sums=('8b4e7dc5a6c5fd666f8f7163232931ab28746d0d17da8fa1cbd68be9e878881b')

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
