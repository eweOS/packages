# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-capture-tiny
pkgver=0.48
pkgrel=1
pkgdesc='Extremely flexible deep comparison'
arch=(any)
url='https://metacpan.org/dist/Capture-Tiny'
license=(PerlArtistic GPL)
depends=(perl perl-test-simple)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-$pkgver.tar.gz")
sha256sums=('6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19')

build() {
	cd Capture-Tiny-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Capture-Tiny-$pkgver
	make test
}

package() {
	cd Capture-Tiny-$pkgver
	make DESTDIR=$pkgdir INSTALLDIRS=vendor install
}
