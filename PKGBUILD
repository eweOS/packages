# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-authen-sasl
_perlname=Authen-SASL
pkgver=2.1700
pkgrel=1
pkgdesc='SASL Authentication framework'
url='https://metacpan.org/dist/Authen-SASL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-digest-hmac)
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('b86d5a576b8d387aee24f39f47a54afd14bb66b09003db5065001f1de03a8ece')

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
