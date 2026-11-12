# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-test-fatal
pkgver=0.019
pkgrel=1
pkgdesc="Incredibly simple helpers for testing code with exceptions"
arch=('any')
url="https://metacpan.org/release/Test-Fatal"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-try-tiny')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-$pkgver.tar.gz)
sha512sums=('fb303a350f775f1a92b170c9083df146b47f9952b41c5006ab4aa18e45c58260376e7e9c5bc16dbd077faedd7cd5042d3d34b849bd88d4312ced8491e9644bde')

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
