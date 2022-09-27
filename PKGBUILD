# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-test-fatal
pkgver=0.016
pkgrel=3
pkgdesc="Incredibly simple helpers for testing code with exceptions"
arch=('any')
url="https://metacpan.org/release/Test-Fatal"
license=('PerlArtistic' 'GPL')
depends=('perl-try-tiny')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-$pkgver.tar.gz)
sha512sums=('SKIP')

build() {
  cd "$srcdir/Test-Fatal-$pkgver"
  perl Makefile.PL
  make
}

check() {
  cd "$srcdir/Test-Fatal-$pkgver"
  make test
}

package() {
  cd "$srcdir/Test-Fatal-$pkgver"
  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install
}
