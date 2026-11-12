# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=perl-lwp-mediatypes
pkgver=6.05
pkgrel=1
pkgdesc="Guess the media type of a file or a URL"
arch=('any')
url="https://metacpan.org/release/LWP-MediaTypes"
depends=('perl')
checkdepends=('perl-test-fatal')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/LWP-MediaTypes-${pkgver}.tar.gz)
sha1sums=('0d6eef78fe4996b69cb17041480e058eeeef09fe')

build() {
  cd "${srcdir}/LWP-MediaTypes-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/LWP-MediaTypes-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/LWP-MediaTypes-${pkgver}"
  make DESTDIR="$pkgdir" install
}
