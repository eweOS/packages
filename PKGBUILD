# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-exception-class
pkgver=1.45
pkgrel=2
pkgdesc='Most commonly needed test functions and features.'
url='https://metacpan.org/dist/Exception-Class'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-class-data-inheritable perl-devel-stacktrace)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Exception-Class-$pkgver.tar.gz")
sha256sums=('5482a77ef027ca1f9f39e1f48c558356e954936fc8fbbdee6c811c512701b249')

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
