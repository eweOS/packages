# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-role-tiny
_perlname=Role-Tiny
pkgver=2.002005
pkgrel=1
pkgdesc='Minimalist role composition tool'
url='https://github.com/moose/Role-Tiny'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Role-Tiny-$pkgver.tar.gz")
sha256sums=('4618ec524618c104dc28a8cc86af129a00cad282aea7f4c75060ba05d4c8f4d7')

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
