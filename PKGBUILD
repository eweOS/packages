# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-crypt-urandom
_perlname=Crypt-URandom
pkgver=0.54
pkgrel=1
pkgdesc='Perl library providing non blocking randomness'
url='https://github.com/david-dick/crypt-urandom'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/D/DD/DDICK/Crypt-URandom-$pkgver.tar.gz")
sha256sums=('4a73cd394933328da484aaeb8645d735b35465df60109e559e0a28b066053a57')

build() {
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
