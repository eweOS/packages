# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-encode-locale
pkgver=1.05
pkgrel=10
pkgdesc="Determine the locale encoding"
arch=('any')
url="https://search.cpan.org/dist/Encode-Locale"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Encode-Locale-$pkgver.tar.gz)
sha1sums=('1e1632e869cb76e3fdbda0a83a192190ed178d60')

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
