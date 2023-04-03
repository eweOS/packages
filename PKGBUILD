# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=perl-locale-gettext
_realname=Locale-gettext
pkgver=1.07
pkgrel=12
pkgdesc="Permits access from Perl to the gettext() family of functions"
arch=(x86_64 aarch64)
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/${_realname}/"
depends=('gettext' 'perl' 'libxcrypt')
options=(!emptydirs)
source=("https://search.cpan.org/CPAN/authors/id/P/PV/PVANDRY/${_realname}-${pkgver}.tar.gz")
sha512sums=('d3716a597d586ee2ff29472ca7b13aaf67770299de31e5f12abafebc879bbe4a1e1dbc0025cf4f3dc29992955f26cffc3be387d974c3911af095d5b49e67a1c6')

build()
{
  cd "${srcdir}/${_realname}-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check()
{
  cd "${srcdir}/${_realname}-${pkgver}"

  make test
}

package()
{
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
