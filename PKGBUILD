# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org> 

pkgname=perl-uri
pkgver=5.32
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
sha512sums=('856b95173adddc0099d00012981ab34f3b853871e590ef7f3e33fbf369b51c03e9f89011f390caf03c7b975b3632d3efb8456b14cc240d5b8a0fe8b8d147fe2c')

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
