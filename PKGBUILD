# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-extutils-hascompiler
pkgver=0.025
pkgrel=1
pkgdesc='Perl module to check for the presence of a compiler.'
url='https://metacpan.org/pod/ExtUtils::HasCompiler'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-HasCompiler-$pkgver.tar.gz")
sha256sums=('02e1e7275df00682d3ca8ea1c27a30591d6dd08b3e3865c0958afae911635a66')

build () {
	cd ExtUtils-HasCompiler-$pkgver
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd ExtUtils-HasCompiler-$pkgver
	make test
}

package() {
	cd ExtUtils-HasCompiler-$pkgver
	make install DESTDIR=$pkgdir
}
