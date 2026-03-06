# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-timedate
pkgver=2.34
pkgrel=1
pkgdesc="Date formating subroutines"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/TimeDate/"
depends=('perl')
provides=('timedate')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/A/AT/ATOOMIC/TimeDate-$pkgver.tar.gz")
sha512sums=('db349b9bb70cee537574efeffa19338a7300566ab7700724bfc0f23160c0483bc6e2724a72181dc59ef6364ea3f9c285d9a90d4ffd8e6d016e59968935f4b8ac')

build() {
  cd TimeDate-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd TimeDate-$pkgver
  make test
}

package() {
  cd TimeDate-$pkgver
  make install DESTDIR="$pkgdir"
}
