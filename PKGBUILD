# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-sub-uplevel
pkgver=0.2800
pkgrel=1
pkgdesc='Apparently run a function in a higher stack frame'
url='https://metacpan.org/dist/Sub-Uplevel'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
checkdepends=(perl-test-simple)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Sub-Uplevel-$pkgver.tar.gz")
sha256sums=('b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d98f3c8cc4a3ece293')

build () {
	cd Sub-Uplevel-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Sub-Uplevel-$pkgver
	make test
}

package() {
	cd Sub-Uplevel-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
