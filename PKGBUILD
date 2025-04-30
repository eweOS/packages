# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-authen-sasl
_perlname=Authen-SASL
pkgver=2.1800
pkgrel=1
pkgdesc='SASL Authentication framework'
url='https://metacpan.org/dist/Authen-SASL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-digest-hmac)
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922')

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
