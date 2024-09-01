# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-io-socket-inet6
_perlname=IO-Socket-INET6
pkgver=2.73
pkgrel=1
pkgdesc='Object interface for AF_INET/AF_INET6 domain sockets'
url='https://metacpan.org/dist/IO-Socket-INET6'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl perl-socket6)
source=("https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/IO-Socket-INET6-$pkgver.tar.gz")
sha256sums=('b6da746853253d5b4ac43191b4f69a4719595ee13a7ca676a8054cf36e6d16bb')

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
