# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org> 

pkgname=perl-uri
pkgver=5.29
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
sha512sums=('b086e3e1b5f13362a9c49f99888773d76ca2d042ff0a0f73650f1e4e76be0d04a6e78206ec8dd4d3098a5bdc9daacfe4ba8779b08f79203bbe45b6ef240852eb')

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
