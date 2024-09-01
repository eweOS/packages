# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-net-ssleay
_perlname=Net-SSLeay
pkgver=1.94
pkgrel=1
pkgdesc='Perl bindings for OpenSSL and LibreSSL'
url='https://metacpan.org/pod/Net::SSLeay'
arch=(x86_64 aarch64 riscv64)
license=(GPL PerlArtistic)
depends=(perl openssl)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHRISN/Net-SSLeay-$pkgver.tar.gz")
sha256sums=('9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d')

build () {
	cd "$_perlname-$pkgver"
	echo n | perl Makefile.PL INSTALLDIRS=vendor
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
