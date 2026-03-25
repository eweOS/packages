# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase="XML-Parser"
pkgname=perl-xml-parser
pkgver=2.52
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/$pkgbase/"
depends=('perl' 'expat')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TODDR/$pkgbase-${pkgver}.tar.gz")
sha512sums=('0fa0cc715c49b7c311a95ae834bf527f198c6a42f5a54f1a18606568d2006c8f9088a870c7aad65c9bcd1d1daa76c9fb542ccc6d51aaf973ce8b5dd126061ad0')

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
