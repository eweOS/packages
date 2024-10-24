# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-class-data-inheritable
pkgver=0.10
pkgrel=1
pkgdesc='Inheritable, overridable class data'
url='https://metacpan.org/dist/Class-Data-Inheritable'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/R/RS/RSHERER/Class-Data-Inheritable-$pkgver.tar.gz")
sha256sums=('aa1ae68a611357b7bfd9a2f64907cc196ddd6d047cae64ef9d0ad099d98ae54a')

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
