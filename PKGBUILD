# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org> 

pkgname=perl-uri
pkgver=5.30
pkgrel=1
pkgdesc="Uniform Resource Identifiers (absolute and relative)"
arch=('any')
url="https://search.cpan.org/dist/URI/"
license=('PerlArtistic')
depends=('perl' 'perl-mime-base32')
checkdepends=('perl-test-needs' 'perl-test-warnings' 'perl-test-fatal')
provides=('perl-uri-escape')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-$pkgver.tar.gz")
sha512sums=('054c0ef59b1eb017e28dff9774b869b700b5cfe7234e2e7e37c70fe5d786459675e4d7600d84b785cf199e0b71e6e7d4490f00b6377044448e2637c2129858d8')

build() {
  cd URI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd URI-$pkgver
  make test
}

package() {
  cd URI-$pkgver
  make install DESTDIR="$pkgdir"
}
