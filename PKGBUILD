# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl-xml-namespacesupport
pkgver=1.12
pkgrel=2
pkgdesc="Generic namespace helpers (ported from SAX2)"
arch=('any')
url="https://search.cpan.org/dist/XML-NamespaceSupport"
license=('GPL')
depends=('perl')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${pkgver}.tar.gz")
sha256sums=('47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef')

build() {
  cd XML-NamespaceSupport-$pkgver

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd XML-NamespaceSupport-$pkgver

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
