# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-extutils-helpers
_pkgname=ExtUtils-Helpers
pkgver=0.026
pkgrel=9
pkgdesc='ExtUtils::Helpers - Various portability utilities for module builders'
arch=('any')
license=('PerlArtistic' 'GPL')
url="https://search.cpan.org/dist/ExtUtils-Helpers/"
options=('!emptydirs')
depends=('perl')
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('372d801f43003c571758823a84bfe418876f1b48e3d8c35f888ca41469f6771a33aa30cf893a4c4a68ea62c6e8c8c6ab2ef44ee783dbf9f25e18bc0389359399')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
