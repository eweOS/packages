# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-simple
pkgver=1.302219
pkgrel=1
pkgdesc="Framework for writing test tools that all work together."
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-$pkgver.tar.gz")
sha256sums=('420600911230de768427f6646758d89b6c07977b565e5b40118e5b8440dbb30b')

build() {
	cd Test-Simple-${pkgver}
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Simple-$pkgver
	make test
}

package() {
	cd Test-Simple-$pkgver
	make DESTDIR="${pkgdir}" install
	rm -r $pkgdir/usr/share/man	# conflicts with perl
}

