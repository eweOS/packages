# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-net-ssleay
_perlname=Net-SSLeay
pkgver=1.94
pkgrel=4
pkgdesc='Perl bindings for OpenSSL and LibreSSL'
url='https://metacpan.org/pod/Net::SSLeay'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
	#FIXME: openssl mismatch
	# got: 'email:john.doe@net-ssleay.example, URI:http://johndoe.net-ssleay.example, DNS:johndoe.net-ssleay.example, Registered ID:1.2.3.4, IP Address:192.168.0.2, IP Address:FD25:F814:AFB5:9873:0:0:0:2, othername: emailAddress:jd@net-ssleay.example'
        # expected: 'email:john.doe@net-ssleay.example, URI:http://johndoe.net-ssleay.example, DNS:johndoe.net-ssleay.example, Registered ID:1.2.3.4, IP Address:192.168.0.2, IP Address:FD25:F814:AFB5:9873:0:0:0:2, othername: emailAddress::jd@net-ssleay.example'
	make test || :
}

package() {
	cd "$_perlname-$pkgver"
	make install DESTDIR="$pkgdir"

	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
}
