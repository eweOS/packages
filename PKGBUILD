# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-class-method-modifiers
_perlname=Class-Method-Modifiers
pkgver=2.15
pkgrel=1
pkgdesc='Library providing moose-like method modifiers'
url='https://github.com/moose/Class-Method-Modifiers'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Class-Method-Modifiers-$pkgver.tar.gz")
sha256sums=('65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc')

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
