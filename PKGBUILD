# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-exception-class
pkgver=1.46
pkgrel=1
pkgdesc='Most commonly needed test functions and features.'
url='https://metacpan.org/dist/Exception-Class'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-class-data-inheritable perl-devel-stacktrace)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Exception-Class-$pkgver.tar.gz")
sha256sums=('e2f8c0708ff8de8b1bb7be1faa3cdb240fdd9774bc741627350577ea7e0e76a1')

build () {
	cd Exception-Class-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Exception-Class-$pkgver
	make test
}

package() {
	cd Exception-Class-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
