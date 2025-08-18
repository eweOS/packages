# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=cabal
pkgver=3.10.3.0
pkgrel=2
pkgdesc='a system for building and packaging Haskell libraries and programs.'
url='https://haskell.org/cabal'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Cluase)
depends=(libffi gmp zlib-ng)
makedepends=(cabal ghc)
source=("https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver.tar.gz"
	"cabal.project.freeze")
sha256sums=('a8e706f0cf30cd91e006ae8b38137aecf65983346f44d0cba4d7a60bbfa3da9e'
            'b99b7911e47b6e07413ce63b27c80267a32009bfaf20fd7750421504fe5e1ac3')

prepare() {
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
