# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-algorithm-diff
pkgver=1.201
pkgrel=2
pkgdesc="Compute 'intelligent' differences between two files / lists"
url='https://metacpan.org/dist/Algorithm-Diff'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Algorithm-Diff-$pkgver.tar.gz")
sha256sums=('0022da5982645d9ef0207f3eb9ef63e70e9713ed2340ed7b3850779b0d842a7d')

build () {
	cd Algorithm-Diff-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Algorithm-Diff-$pkgver
	make test
}

package() {
	cd Algorithm-Diff-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
