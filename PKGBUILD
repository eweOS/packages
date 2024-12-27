# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-digest-hmac
_perlname=Digest-HMAC
pkgver=1.05
pkgrel=2
pkgdesc='Keyed-Hashing for Message Authentication'
url='https://metacpan.org/dist/Digest-HMAC'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-$pkgver.tar.gz")
sha256sums=('215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a')

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
