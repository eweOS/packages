# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-crypt-urandom
_perlname=Crypt-URandom
pkgver=0.55
pkgrel=1
pkgdesc='Perl library providing non blocking randomness'
url='https://github.com/david-dick/crypt-urandom'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/D/DD/DDICK/Crypt-URandom-$pkgver.tar.gz")
sha256sums=('ef9f44141073c13573e85b148ff9a9089c45825b7d6608d832e4263899d3a2d4')

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
