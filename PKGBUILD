# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=perl-file-slurper
_dist=File-Slurper
pkgver=0.013
pkgrel=1
pkgdesc="A simple, sane and efficient module to slurp a file"
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-warnings')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_dist}-${pkgver}.tar.gz)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
