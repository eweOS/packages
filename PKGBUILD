# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-differences
pkgver=0.72
pkgrel=2
pkgdesc='Test strings and data structures and show differences if not ok'
url='https://metacpan.org/dist/Test-Differences'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-test-simple perl-text-diff perl-capture-tiny)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCANTRELL/Test-Differences-$pkgver.tar.gz")
sha256sums=('648844b9dcb7dae6f9b5a15c9359d0f09de247a624b65c4620ebff249558f913')

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
