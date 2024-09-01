# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-socket6
_perlname=Socket6
pkgver=0.29
pkgrel=1
pkgdesc='Perl module providing IPv6 related part of the C socket.h defines and structure manipulators'
url='https://metacpan.org/dist/Socket6'
arch=(x86_64 aarch64 riscv64)
license=(GPL PerlArtistic)
depends=(perl musl)
source=("https://cpan.metacpan.org/authors/id/U/UM/UMEMOTO/Socket6-$pkgver.tar.gz")
sha256sums=('468915fa3a04dcf6574fc957eff495915e24569434970c91ee8e4e1459fc9114')

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
