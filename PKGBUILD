# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-simple
pkgver=1.302204
pkgrel=1
pkgdesc="Framework for writing test tools that all work together."
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-$pkgver.tar.gz")
sha256sums=('03749d1027a7817ca7f11e420ef72951f20a849ea65af2eb595f34df47d1226e')

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

