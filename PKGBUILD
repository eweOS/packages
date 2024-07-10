# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-differences
pkgver=0.71
pkgrel=2
pkgdesc='Test strings and data structures and show differences if not ok'
url='https://metacpan.org/dist/Test-Differences'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-test-simple perl-text-diff perl-capture-tiny)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCANTRELL/Test-Differences-$pkgver.tar.gz")
sha256sums=('cac16a56cd843b0809e5b49199d60d75a8dbad7ca9a08380dbf3f5cc3aaa38d9')

build () {
	cd Test-Differences-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Test-Differences-$pkgver
	make test
}

package() {
	cd Test-Differences-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
