# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-io-socket-ssl
_perlname=IO-Socket-SSL
pkgver=2.095
pkgrel=2
pkgdesc='Perl module providing SSL sockets with IO::Socket interface'
url='https://metacpan.org/dist/IO-Socket-SSL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-uri perl-net-ssleay)
checkdepends=(perl-io-socket-inet6)
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-$pkgver.tar.gz")
sha256sums=('7e764392b1b8bd44e654183c082b75be47800e98d7cd325f0e1b76c7d9a6b768')

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
