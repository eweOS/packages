# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-authen-sasl
_perlname=Authen-SASL
pkgver=2.2100
pkgrel=1
pkgdesc='SASL Authentication framework'
url='https://metacpan.org/dist/Authen-SASL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-digest-hmac perl-crypt-urandom)
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('4f0f100aeed34b52977a94b7df973e7f0b8f92d167b09f2b249bab81e8590e57')

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
