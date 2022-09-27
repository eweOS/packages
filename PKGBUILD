# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-try-tiny
pkgver=0.31
pkgrel=2
pkgdesc="Minimal try/catch with proper localization of \$@"
arch=('any')
url="https://search.cpan.org/dist/Try-Tiny"
license=('MIT')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd Try-Tiny-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Try-Tiny-${pkgver}
  make test
}

package() {
  cd Try-Tiny-${pkgver}
  make DESTDIR="$pkgdir" install
  # upstream typo :/
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
