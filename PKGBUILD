# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=shellcheck
pkgver=0.10.0
pkgrel=1
pkgdesc='A static analysis tool for shell scripts'
url='https://www.shellcheck.net/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-3.0-or-later)
depends=(musl libffi gmp)
makedepends=(cabal ghc)
source=("https://github.com/koalaman/shellcheck/archive/refs/tags/v$pkgver.tar.gz"
	"cabal.project.freeze")
sha256sums=('149ef8f90c0ccb8a5a9e64d2b8cdd079ac29f7d2f5a263ba64087093e9135050'
            '066e30623d9293794fd637e3a3a7dfdc631ece2dcb5cab94f4697d56dff30533')

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

package() {
	cd "$pkgname-$pkgver"

	for f in $(HOME="$srcdir/dist" cabal list-bin shellcheck); do
		install -Dm755 "$f" "$pkgdir"/usr/bin/"$(basename $f)"
	done
}
