# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-regexp-common
_perlname=Regexp-Common
pkgver=2024080801
pkgrel=1
pkgdesc='Commonly requested regular expressions in Perl'
url='https://www.nxp.com/docs/en/user-guide/UM10204.pdf'
arch=(any)
license=('Artistic-1.0-Perl OR Artistic-2.0 OR BSD-3-Clause OR MIT')
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/A/AB/ABIGAIL/Regexp-Common-$pkgver.tar.gz")
sha256sums=('0677afaec8e1300cefe246b4d809e75cdf55e2cc0f77c486d13073b69ab4fbdd')

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

	for license in AL AL2 BSD MIT; do
		_install_license_ COPYRIGHT."$license" COPYRIGHT."$license"
	done

	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
}
