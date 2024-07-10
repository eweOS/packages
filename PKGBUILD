# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-deep
pkgver=1.204
pkgrel=2
pkgdesc='Extremely flexible deep comparison'
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=(perl perl-test-simple)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Deep-$pkgver.tar.gz")
sha256sums=('b6591f6ccdd853c7efc9ff3c5756370403211cffe46047f082b1cd1611a84e5f')

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
