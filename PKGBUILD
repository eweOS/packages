# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org> 

pkgname=perl-uri
pkgver=5.31
pkgrel=2
pkgdesc="Uniform Resource Identifiers (absolute and relative)"
arch=('any')
url="https://search.cpan.org/dist/URI/"
license=('PerlArtistic')
depends=('perl' 'perl-mime-base32')
checkdepends=('perl-test-needs' 'perl-test-warnings' 'perl-test-fatal')
provides=('perl-uri-escape')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-$pkgver.tar.gz")
sha512sums=('81bc29fbfc06c4b884bc5d47b6b7a3d171f526bb1edd6618aec6d72a65407c3130130dbfe31de18c439d03f5e60cfab6573352b1473959c6edc6e4ad828672c5')

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
