# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=shellcheck
pkgver=0.11.0
pkgrel=2
pkgdesc='A static analysis tool for shell scripts'
url='https://www.shellcheck.net/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-3.0-or-later)
depends=(musl libffi libnuma gmp)
makedepends=(cabal ghc)
source=("https://github.com/koalaman/shellcheck/archive/refs/tags/v$pkgver.tar.gz"
	"cabal.project.freeze")
sha256sums=('8b07554f92e4fbfc33f1539a1f475f21c6503ceae8f806efcc518b1f529f7102'
            'b79c5921e9699b773af13b80b51d58f7893d0b633819f4314a5c3ad5a245adf5')

prepare() {
	_cabal_home="$srcdir/dist"

	cd "$pkgname-$pkgver"
	HOME="$_cabal_home" cabal v2-update
	HOME="$_cabal_home" cabal v2-freeze --shadow-installed-packages
	mv "$srcdir"/cabal.project.freeze "$srcdir/$pkgname-$pkgver"
}

build () {
	cd "$pkgname-$pkgver"
	HOME="$srcdir/dist" cabal v2-build	\
		--jobs="$JOBS"			\
		--prefix=/usr
}

check() {
	cd "$pkgname-$pkgver"
	HOME="$srcdir/dist" cabal v2-test	\
		--jobs="$JOBS"
}

package() {
	cd "$pkgname-$pkgver"

	for f in $(HOME="$srcdir/dist" cabal list-bin shellcheck); do
		install -Dm755 "$f" "$pkgdir"/usr/bin/"$(basename $f)"
	done
}
