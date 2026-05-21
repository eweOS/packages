# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-sub-quote
_perlname=Sub-Quote
pkgver=2.006009
pkgrel=2
pkgdesc='Efficient subroutine generation via string evaluation'
url='https://github.com/moose/Sub-Quote'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Sub-Quote-$pkgver.tar.gz")
sha256sums=('967282d54d2d51b198c67935594f93e4dea3e54d1e5bced158c94e29be868a4b')

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
