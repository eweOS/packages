# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-cpan-requirements-dynamic
pkgver=0.001
pkgrel=1
pkgdesc='Dynamic prerequisites in meta files.'
url='https://metacpan.org/pod/CPAN::Requirements::Dynamic'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
makedepends=(perl-extutils-config perl-extutils-hascompiler)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-$pkgver.tar.gz")
sha256sums=('4b590e712b9aca680c3631855ee16a50b84fa0227c362e13b237a75a01489ef5')

build () {
	cd CPAN-Requirements-Dynamic-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd CPAN-Requirements-Dynamic-$pkgver
	make test
}

package() {
	cd CPAN-Requirements-Dynamic-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
