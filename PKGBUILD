# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-authen-sasl
_perlname=Authen-SASL
pkgver=2.2000
pkgrel=1
pkgdesc='SASL Authentication framework'
url='https://metacpan.org/dist/Authen-SASL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-digest-hmac perl-crypt-urandom)
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99')

build () {
	cd "$_perlname-$pkgver"
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "$_perlname-$pkgver"
	make test
}

package() {
	cd "$_perlname-$pkgver"
	make install DESTDIR="$pkgdir"

	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
}
