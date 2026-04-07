# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=alex
pkgver=3.5.4.2
pkgrel=1
pkgdesc='A tool for generating lexical analysers in Haskell'
url='https://hackage.haskell.org/package/alex'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(libffi gmp libnuma zlib-ng)
makedepends=(ghc)
source=("https://hackage.haskell.org/package/alex-$pkgver/alex-$pkgver.tar.gz")
sha256sums=('df481dc960e2c59a30395f7335031fd4ef8773b8a42894a4f2320e00ff474418')

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
