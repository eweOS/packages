# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-module-build-tiny
_pkgname=Module-Build-Tiny
pkgver=0.047
pkgrel=2
pkgdesc="A tiny replacement for Module::Build"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-config' 'perl-extutils-helpers' 'perl-extutils-installpaths')
url="https://search.cpan.org/dist/Module-Build-Tiny"
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('505e8a1a1d7e4f73a820352b476c938769bee1b069eaee0df7a95ea5651f109dfb106faf82bf423ca96b15d0148fd890342ad214b4fa6481d15b8f494fe48a30')

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
