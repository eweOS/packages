# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-exception
pkgver=0.43
pkgrel=2
pkgdesc='Test exception-based code'
url='https://metacpan.org/dist/Test-Exception'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-sub-uplevel)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Exception-$pkgver.tar.gz")
sha256sums=('156b13f07764f766d8b45a43728f2439af81a3512625438deab783b7883eb533')

build () {
	cd Test-Exception-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Test-Exception-$pkgver
	make test
}

package() {
	cd Test-Exception-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
