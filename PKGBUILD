# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-deep
pkgver=1.205
pkgrel=1
pkgdesc='Extremely flexible deep comparison'
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=(perl perl-test-simple)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Deep-$pkgver.tar.gz")
sha256sums=('42781e9943a7a215e662c4973b9feafdc019fd16469bdb849a8537ee58956273')

build() {
	cd Test-Deep-${pkgver}
	perl Makefile.PL
	make
}

check() {
	cd Test-Deep-$pkgver
	make test
}

package() {
	cd Test-Deep-$pkgver
	make DESTDIR=$pkgdir INSTALLDIRS=vendor install
}
