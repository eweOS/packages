# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-error
pkgver=0.17029
pkgrel=4
pkgdesc="Perl/CPAN Error module - Error/exception handling in an OO-ish way"
url="https://search.cpan.org/dist/Error/"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz)
sha512sums=('SKIP')

build() {
  cd Error-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make 
}

check() {
  cd Error-${pkgver}
  make test
}

package() {
  cd Error-${pkgver}
  make DESTDIR="${pkgdir}" install
}

