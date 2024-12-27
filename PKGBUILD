# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-mailtools
_perlname=MailTools
pkgver=2.22
pkgrel=2
pkgdesc='Mail related Perl modules'
url='https://metacpan.org/dist/MailTools'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-timedate)
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MailTools-$pkgver.tar.gz")
sha256sums=('3bf68bb212298fa699a52749dddff35583a74f36a92ca89c843b854f29d87c77')

build () {
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
