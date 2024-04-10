# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-b-cow
pkgver=0.007
pkgrel=1
pkgdesc='B::COW additional B helpers to check COW status'
url='https://metacpan.org/dist/B-COW'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/B-COW-0.007.tar.gz")
sha256sums=('1290daf227e8b09889a31cf182e29106f1cf9f1a4e9bf7752f9de92ed1158b44')

build () {
	cd B-COW-$pkgver
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd B-COW-$pkgver
	make test
}

package() {
	cd B-COW-$pkgver
	make install DESTDIR=$pkgdir
	_install_license_ LICENSE
}
