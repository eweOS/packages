# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-test-differences
pkgver=0.73
pkgrel=1
pkgdesc='Test strings and data structures and show differences if not ok'
url='https://metacpan.org/dist/Test-Differences'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-test-simple perl-text-diff perl-capture-tiny)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCANTRELL/Test-Differences-$pkgver.tar.gz")
sha256sums=('3c113f4e25c38323a3fe5992d30c337264d00ef872aecfd2d9431ca8ea0083e2')

build () {
	cd Test-Differences-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Test-Differences-$pkgver
	make test
}

package() {
	cd Test-Differences-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
