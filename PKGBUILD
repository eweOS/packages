# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-class-data-inheritable
pkgver=0.09
pkgrel=1
pkgdesc='Inheritable, overridable class data'
url='https://metacpan.org/dist/Class-Data-Inheritable'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/R/RS/RSHERER/Class-Data-Inheritable-$pkgver.tar.gz")
sha256sums=('44088d6e90712e187b8a5b050ca5b1c70efe2baa32ae123e9bd8f59f29f06e4d')

build () {
	cd Class-Data-Inheritable-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Class-Data-Inheritable-$pkgver
	make test
}

package() {
	cd Class-Data-Inheritable-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
