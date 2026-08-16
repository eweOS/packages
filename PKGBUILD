# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-io-socket-ssl
_perlname=IO-Socket-SSL
pkgver=2.099
pkgrel=1
pkgdesc='Perl module providing SSL sockets with IO::Socket interface'
url='https://metacpan.org/dist/IO-Socket-SSL'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-uri perl-net-ssleay)
checkdepends=(perl-io-socket-inet6)
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-$pkgver.tar.gz")
sha256sums=('a0be800ff4852b1567ee5500e772417ad7a360abff80c01b5b875c15d44be832')

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
