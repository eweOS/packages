# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-devel-stacktrace
pkgver=2.05
pkgrel=1
pkgdesc='An object representing a stack trace'
url='https://metacpan.org/dist/Devel-StackTrace'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/Devel-StackTrace-$pkgver.tar.gz")
sha256sums=('63cb6196e986a7e578c4d28b3c780e7194835bfc78b68eeb8f00599d4444888c')

build () {
	cd Devel-StackTrace-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Devel-StackTrace-$pkgver
	make test
}

package() {
	cd Devel-StackTrace-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
