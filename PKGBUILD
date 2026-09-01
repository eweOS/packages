# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org> 

pkgname=perl-uri
pkgver=5.36
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
sha512sums=('2d6e18f3b30a4bb21456da478f006ea080121d783abe198970cf515cd0b71bca8c163d33dfd457b9bd758e4abecad9d664d64f76778ae71447b5fae1236059a7')

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
