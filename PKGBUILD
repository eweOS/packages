# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-test-needs
pkgver=0.002009
pkgrel=3
pkgdesc="Skip tests when modules not available"
arch=('any')
license=('PerlArtistic')
url="https://metacpan.org/release/Test-Needs"
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Test-Needs-$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd Test-Needs-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Test-Needs-$pkgver
  make test
}

package() {
  cd Test-Needs-$pkgver
  make DESTDIR="$pkgdir" install
}
