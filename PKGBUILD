# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-warn
pkgver=0.37
pkgrel=2
pkgdesc='Perl extension to test methods for warnings'
url='https://metacpan.org/dist/Test-Warn'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-sub-uplevel)
checkdepends=(perl-test-simple)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/B/BI/BIGJ/Test-Warn-$pkgver.tar.gz")
sha256sums=('98ca32e7f2f5ea89b8bfb9a0609977f3d153e242e2e51705126cb954f1a06b57')

build () {
	cd Test-Warn-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Test-Warn-$pkgver
	make test
}

package() {
	cd Test-Warn-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
