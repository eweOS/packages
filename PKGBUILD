# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-module-build-tiny
_pkgname=Module-Build-Tiny
pkgver=0.053
pkgrel=1
pkgdesc="A tiny replacement for Module::Build"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-config' 'perl-extutils-helpers'
	 'perl-extutils-installpaths' 'perl-cpan-requirements-dynamic')
url="https://search.cpan.org/dist/Module-Build-Tiny"
source=("https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('93707530cfb010d27bc21177cebabb17e820158ef813853d8c664570de9b40c54bb86d9b03db0964245530e72661b3c527159d7c6f836c6468c4bde24f6f6719')

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
