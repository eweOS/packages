# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-test-fatal
pkgver=0.018
pkgrel=2
pkgdesc="Incredibly simple helpers for testing code with exceptions"
arch=('any')
url="https://metacpan.org/release/Test-Fatal"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-try-tiny')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-$pkgver.tar.gz)
sha512sums=('3c88d6fa62a99ad5d45d9797e54d3cbcb5fbfc3b3f901d43d5c965df80611ea4a60c28d42a5e2684091f583f430049ca31ba79e17638da1144ea4caa48356abf')

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
