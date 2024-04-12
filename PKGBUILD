# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-most
pkgver=0.38
pkgrel=1
pkgdesc='Most commonly needed test functions and features.'
url='https://metacpan.org/dist/Test-Most'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-exception-class perl-test-deep perl-test-differences
	 perl-test-exception perl-test-warn)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Most-$pkgver.tar.gz");
sha256sums=('089eb894f7bace4c37c6334e0e290eb20338ee10223af0c82cbe7281c78382df')

build () {
	cd Test-Most-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Test-Most-$pkgver
	make test
}

package() {
	cd Test-Most-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
