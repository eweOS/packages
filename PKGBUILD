# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-simple
pkgver=1.302214
pkgrel=1
pkgdesc="Framework for writing test tools that all work together."
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-$pkgver.tar.gz")
sha256sums=('6077ecc35f37b11b3b75df2d0ba1b9ca541f1dc24b2be8e15b6e91f78e2e03fc')

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

