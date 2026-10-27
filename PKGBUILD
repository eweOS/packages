# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=perl-file-sharedir
_perlname=File-ShareDir
pkgver=1.118
pkgrel=1
pkgdesc='Perl module for locating per-dist and per-module shared files'
url='https://metacpan.org/pod/File::ShareDir'
arch=(any)
license=(GPL-1.0-or-later PerlArtistic)
depends=(perl perl-class-inspector perl-file-sharedir-install)
source=("https://cpan.metacpan.org/authors/id/R/RE/REHSACK/File-ShareDir-$pkgver.tar.gz")
sha256sums=('3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958')

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
