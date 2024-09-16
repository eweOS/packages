# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-module-build-tiny
_pkgname=Module-Build-Tiny
pkgver=0.051
pkgrel=1
pkgdesc="A tiny replacement for Module::Build"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-config' 'perl-extutils-helpers'
	 'perl-extutils-installpaths' 'perl-cpan-requirements-dynamic')
url="https://search.cpan.org/dist/Module-Build-Tiny"
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('205e509c752caf284ccf981864b59ee69238b2255c4ece03f06e9f4482922c2b4c1abaf2037d57232b87e70c5f566bab5cd01006a9017b996c91846eee6b7eb2')

build()
{
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null \
      CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
    ./Build test
  )
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  (
    export PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
    ./Build install
  )
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
