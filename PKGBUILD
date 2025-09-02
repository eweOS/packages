# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-cpan-requirements-dynamic
pkgver=0.002
pkgrel=2
pkgdesc='Dynamic prerequisites in meta files.'
url='https://metacpan.org/pod/CPAN::Requirements::Dynamic'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
makedepends=(perl-extutils-config perl-extutils-hascompiler)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-$pkgver.tar.gz")
sha256sums=('9e290179fd1ab8574f7a2297baf015ea4fef3703a99d48798f61ec9347b4905b')

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
