# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-http-date
pkgver=6.08
pkgrel=1
pkgdesc="Date conversion routines"
arch=('any')
url="https://search.cpan.org/dist/HTTP-Date"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-timedate')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Date-$pkgver.tar.gz)
sha1sums=('8ea3f3543f8ad814a800783f9bef40e8767ef124')

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
