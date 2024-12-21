# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-capture-tiny
pkgver=0.50
pkgrel=1
pkgdesc='Extremely flexible deep comparison'
arch=(any)
url='https://metacpan.org/dist/Capture-Tiny'
license=(PerlArtistic GPL)
depends=(perl perl-test-simple)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-$pkgver.tar.gz")
sha256sums=('ca6e8d7ce7471c2be54e1009f64c367d7ee233a2894cacf52ebe6f53b04e81e5')

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
