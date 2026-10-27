# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-file-sharedir-install
_perlname=File-ShareDir-Install
pkgver=0.14
pkgrel=1
pkgdesc='Utils to install shared read-only data from a distribution'
url='https://metacpan.org/dist/File-ShareDir-Install'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/File-ShareDir-Install-$pkgver.tar.gz")
sha256sums=('8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0')

build() {
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
