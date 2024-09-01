# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-digest-hmac
_perlname=Digest-HMAC
pkgver=1.04
pkgrel=1
pkgdesc='Keyed-Hashing for Message Authentication'
url='https://metacpan.org/dist/Digest-HMAC'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-$pkgver.tar.gz")
sha256sums=('d6bc8156aa275c44d794b7c18f44cdac4a58140245c959e6b19b2c3838b08ed4')

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
