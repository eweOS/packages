# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-role-tiny
_perlname=Role-Tiny
pkgver=2.002004
pkgrel=1
pkgdesc='Minimalist role composition tool'
url='https://github.com/moose/Role-Tiny'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Role-Tiny-$pkgver.tar.gz")
sha256sums=('d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45')

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
