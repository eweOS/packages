# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-extutils-config
_pkgname=ExtUtils-Config
pkgver=0.009
pkgrel=1
pkgdesc="ExtUtils::Config - A wrapper for perl's configuration"
arch=('any')
license=('PerlArtistic' 'GPL')
url="https://search.cpan.org/dist/ExtUtils-Config/"
options=(!emptydirs)
makedepends=('perl')
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7f3d054f31b08a9179dbad47204f9223607d8af84e4dfa1e9250981dd271b753576e571e2071d94408340376f13d3d766278d23407b7c754dbc493b7df30e2cd')

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

