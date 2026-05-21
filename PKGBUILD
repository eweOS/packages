# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-timedate
pkgver=2.35
pkgrel=2
pkgdesc="Date formating subroutines"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/TimeDate/"
depends=('perl')
provides=('timedate')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/A/AT/ATOOMIC/TimeDate-$pkgver.tar.gz")
sha512sums=('8c508a958e7ce98638ba9d16606b9b769da822ee61e7b8d8143e0ff5a45edb6b60710e826046510c966ecf5d3bf28f003dcf38a0b94f7319ba46c80c6e889f87')

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
