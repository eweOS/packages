# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-encode-locale
pkgver=1.05
pkgrel=9
pkgdesc="Determine the locale encoding"
arch=('any')
url="https://search.cpan.org/dist/Encode-Locale"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Encode-Locale-$pkgver.tar.gz)
sha1sums=('SKIP')

build() {
  cd Encode-Locale-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Encode-Locale-$pkgver
  make test
}

package() {
  cd Encode-Locale-$pkgver
  make DESTDIR="$pkgdir" install
}
