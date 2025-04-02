# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-simple
pkgver=1.302210
pkgrel=1
pkgdesc="Framework for writing test tools that all work together."
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-$pkgver.tar.gz")
sha256sums=('acb9ca8d582b8c0bbe53c6d9b3264f1cf66eaa7135f41f979747104183aea509')

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

