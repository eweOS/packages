# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase="XML-Parser"
pkgname=perl-xml-parser
pkgver=2.59
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/$pkgbase/"
depends=('perl' 'expat')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TODDR/$pkgbase-${pkgver}.tar.gz")
sha512sums=('395ad365ae6209827737448711d5d5f61daf013380d196d26a5c7a88c0aa353baa09c775e6086622b491e515824b957022f4c119264559127fdb97f4cbe22381')

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
