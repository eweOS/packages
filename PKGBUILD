# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-moo
_perlname=Moo
pkgver=2.005005
pkgrel=1
pkgdesc='Minimal object orientation for Perl'
url='https://metacpan.org/dist/Moo'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl perl-sub-quote perl-role-tiny perl-class-method-modifiers)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Moo-$pkgver.tar.gz")
sha256sums=('fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108')

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
