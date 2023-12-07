# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-http-date
pkgver=6.06
pkgrel=1
pkgdesc="Date conversion routines"
arch=('any')
url="https://search.cpan.org/dist/HTTP-Date"
license=('PerlArtistic' 'GPL')
depends=('perl-timedate')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Date-$pkgver.tar.gz)
sha1sums=('c0650f3282b0f49c5127e746039dda153636ce92')

build() {
  cd HTTP-Date-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTTP-Date-$pkgver
  make test
}

package() {
  cd HTTP-Date-$pkgver
  make DESTDIR="$pkgdir" install
}
