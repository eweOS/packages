# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-clone
pkgver=0.46
pkgrel=2
pkgdesc='recursively copy Perl datatypes '
url='https://metacpan.org/dist/Clone'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
checkdepends=(perl-test-simple perl-b-cow)
source=("https://cpan.metacpan.org/authors/id/G/GA/GARU/Clone-$pkgver.tar.gz")
sha256sums=('aadeed5e4c8bd6bbdf68c0dd0066cb513e16ab9e5b4382dc4a0aafd55890697b')

build () {
	cd Clone-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Clone-$pkgver
	make test
}

package() {
	cd Clone-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
