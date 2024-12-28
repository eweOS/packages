# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-simple
pkgver=1.302207
pkgrel=1
pkgdesc="Framework for writing test tools that all work together."
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-$pkgver.tar.gz")
sha256sums=('5ce22181e77859db99ef4abb4019e5949cb8829d6ef61b62ae8834234c589807')

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

