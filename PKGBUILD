# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-extutils-config
_pkgname=ExtUtils-Config
pkgver=0.008
pkgrel=8
pkgdesc="ExtUtils::Config - A wrapper for perl's configuration"
arch=('any')
license=('PerlArtistic' 'GPL')
url="https://search.cpan.org/dist/ExtUtils-Config/"
options=(!emptydirs)
makedepends=('perl')
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('SKIP')

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

