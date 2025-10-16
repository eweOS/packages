# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-authen-sasl
_perlname=Authen-SASL
pkgver=2.1900
pkgrel=1
pkgdesc='SASL Authentication framework'
url='https://metacpan.org/dist/Authen-SASL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-digest-hmac perl-crypt-urandom)
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('be3533a6891b2e677150b479c1a0d4bf11c8bbeebed3e7b8eba34053e93923b0')

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
