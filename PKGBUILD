# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-mailtools
_perlname=MailTools
pkgver=2.21
pkgrel=1
pkgdesc='Mail related Perl modules'
url='https://metacpan.org/dist/MailTools'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-timedate)
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MailTools-$pkgver.tar.gz")
sha256sums=('4ad9bd6826b6f03a2727332466b1b7d29890c8d99a32b4b3b0a8d926ee1a44cb')

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
