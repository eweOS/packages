# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-io-socket-ssl
_perlname=IO-Socket-SSL
pkgver=2.098
pkgrel=1
pkgdesc='Perl module providing SSL sockets with IO::Socket interface'
url='https://metacpan.org/dist/IO-Socket-SSL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-uri perl-net-ssleay)
checkdepends=(perl-io-socket-inet6)
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-$pkgver.tar.gz")
sha256sums=('b38473be20256b1a06447dd6769ad162bfad6a258234ed2c7e2e1819c16c4df7')

build () {
	cd "$_perlname-$pkgver"
	# disable tests which needs network traffic
	yes | perl Makefile.PL INSTALLDIRS=vendor
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
