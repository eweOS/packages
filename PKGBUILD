# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-class-inspector
_perlname=Class-Inspector
pkgver=1.36
pkgrel=1
pkgdesc='Get information about a class and its structure'
url='https://metacpan.org/dist/Class-Inspector'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Class-Inspector-$pkgver.tar.gz")
sha256sums=('cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e')

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
