# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=cabal
pkgver=3.8.1.0
pkgrel=3
pkgdesc='a system for building and packaging Haskell libraries and programs.'
url='https://haskell.org/cabal'
arch=(x86_64 aarch64)
license=(BSD-3-Cluase)
depends=(libffi gmp zlib-ng)
makedepends=(cabal ghc)
source=("https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver.tar.gz"
	"fix-version.patch"
	"cabal.project.freeze")
sha256sums=('61ce436f2e14e12bf07ea1c81402362f46275014cd841a76566f0766d0ea67e6'
            '9fdfe704e873d469f94199621fe78d1b97583da47202cc4403012ce1796994b6'
            '2e3831b53296e7cce2a85bc280b73306aff6c5af676c8ef9b820cbe8a74d4038')

prepare() {
	_patch_ cabal-install-"$pkgver"

	_cabal_home="$srcdir/dist"
	cd cabal-install-"$pkgver"
	HOME="$_cabal_home" cabal v2-update
	HOME="$_cabal_home" cabal v2-freeze --shadow-installed-packages
	mv "$srcdir"/cabal.project.freeze .
}

build () {
	cd cabal-install-"$pkgver"
	HOME="$srcdir/dist" cabal v2-build	\
		-j$JOBS				\
		--prefix=/usr
}

package() {
	cd cabal-install-"$pkgver"

	for exe in $(HOME="$srcdir/dist" cabal list-bin cabal-install:exes); do
		install -Dm755 "$exe" "$pkgdir"/usr/bin/"$(basename $exe)"
	done

	_install_license_ LICENSE
}
