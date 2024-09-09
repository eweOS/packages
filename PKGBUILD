# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-mime-base32
_perlname=MIME-Base32
pkgver=1.303
pkgrel=1
pkgdesc='Base32 encoder and decoder for Perl'
url='https://github.com/perl5-utils/MIME-Base32'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/R/RE/REHSACK/MIME-Base32-$pkgver.tar.gz")
sha256sums=('ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99')

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
