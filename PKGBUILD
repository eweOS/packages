# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl-xml-simple
_realname=XML-Simple
pkgver=2.25
pkgrel=1
pkgdesc="Simple XML parser for perl"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/${_realname}/"
depends=('perl-xml-sax-expat')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/G/GR/GRANTM/${_realname}-${pkgver}.tar.gz")
sha512sums=('0f1a6a1bdb8f6ac6fa4deef33d09930eb4758b4a3ed4431624004ffa2b1eb02f0d6ce14cb4942162cb76f7aa39fea4ec6a71e1eb9ebd464b710db7024bdd990c')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
