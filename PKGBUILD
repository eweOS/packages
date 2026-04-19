# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-parallel-forkmanager
_perlname=Parallel-ForkManager
pkgver=2.04
pkgrel=1
pkgdesc='Parallel processing fork manager in Perl'
url='https://github.com/dluxhu/perl-parallel-forkmanager'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl perl-moo)
checkdepends=(perl-test-warn)
source=("https://cpan.metacpan.org/authors/id/Y/YA/YANICK/Parallel-ForkManager-$pkgver.tar.gz")
sha256sums=('606894fc2e9f7cd13d9ec099aaac103a8f0943d1d80c2c486bae14730a39b7fc')

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
