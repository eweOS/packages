# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-error
pkgver=0.17031
pkgrel=1
pkgdesc="Perl/CPAN Error module - Error/exception handling in an OO-ish way"
url="https://search.cpan.org/dist/Error/"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz)
sha512sums=('02db3ac45d099d182d1c3dfd83db64df4a582511128e1141315a052fdc5f2c626c883fc3c0567b6ed97c2fe5aa4a2a71b5086b3242c104589d3de938f3d70359')

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

