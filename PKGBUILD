# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase="XML-Parser"
pkgname=perl-xml-parser
pkgver=2.47
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=(x86_64 aarch64 riscv64)
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/$pkgbase/"
depends=('expat')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TODDR/$pkgbase-${pkgver}.tar.gz")
sha512sums=('3f9de53341bc85b87c88ad31e04b13f1f95516eec0d7e5fd1c1a3b3e66a91ca3d4de7c649978599219a4d4372f6218764ab5e1805b7155b5ca200006e1b0908f')

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
