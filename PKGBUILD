# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-try-tiny
pkgver=0.32
pkgrel=1
pkgdesc="Minimal try/catch with proper localization of \$@"
arch=('any')
url="https://search.cpan.org/dist/Try-Tiny"
license=('MIT')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-${pkgver}.tar.gz")
sha512sums=('18610525e1b754760f41a5d9a836a4e78c22ba1b008f7ac16b2796916ef688b03c7cc3002cfc61b274492455a906e75dbe0e2a06ead4e08b33e1c6a0a8569c4e')

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
