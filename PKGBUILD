# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase="XML-Parser"
pkgname=perl-xml-parser
pkgver=2.46
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=(x86_64 aarch64 riscv64)
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/$pkgbase/"
depends=('expat')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TODDR/$pkgbase-${pkgver}.tar.gz")
sha512sums=('c4609495cc5ca34952f61876a690ef76d42eee6689d1bedb8036c9eab918525ec5213f1639c7178c029ee0f8765a2ca5eb0197f6e39b8be6d5dbc3f3c1d0b389')

build() {
  cd $pkgbase-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $pkgbase-$pkgver
  make test
}

package() {
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
}
