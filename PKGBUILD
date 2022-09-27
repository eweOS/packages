# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-timedate
pkgver=2.33
pkgrel=4
pkgdesc="Date formating subroutines"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/TimeDate/"
depends=('perl')
provides=('timedate')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/A/AT/ATOOMIC/TimeDate-$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd TimeDate-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd TimeDate-$pkgver
  make test
}

package() {
  cd TimeDate-$pkgver
  make install DESTDIR="$pkgdir"
}
