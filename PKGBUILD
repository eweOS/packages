# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-http-date
pkgver=6.05
pkgrel=5
pkgdesc="Date conversion routines"
arch=('any')
url="https://search.cpan.org/dist/HTTP-Date"
license=('PerlArtistic' 'GPL')
depends=('perl-timedate')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Date-$pkgver.tar.gz)
sha1sums=('SKIP')

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
