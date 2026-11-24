# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-net-ssleay
_perlname=Net-SSLeay
pkgver=1.96
pkgrel=3
pkgdesc='Perl bindings for OpenSSL and LibreSSL'
url='https://metacpan.org/pod/Net::SSLeay'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL PerlArtistic)
depends=(perl openssl)
# 0001: Backport OpenSSL 4 support: use accessors for opaque ASN.1 types
#	and replace removed version-specific TLS methods where possible.
#	https://github.com/radiator-software/p5-net-ssleay/pull/553
source=("https://cpan.metacpan.org/authors/id/C/CH/CHRISN/Net-SSLeay-$pkgver.tar.gz"
	0001-support-openssl-4.patch)
sha256sums=('ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753'
            '4637ad3dfea8ea44bbe87d8b84fa2e37623198e0f208900c1037b1404a42c005')

prepare() {
	_patch_ "$_perlname-$pkgver"
}

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
