# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=perl-http-daemon
pkgver=6.16
pkgrel=1
pkgdesc="Simple http server class"
arch=('any')
url='https://metacpan.org/pod/HTTP::Daemon'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-http-date' 'perl-http-message' 'perl-lwp-mediatypes')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-needs')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Daemon-${pkgver}.tar.gz)
sha256sums=('b38d092725e6fa4e0c4dc2a47e157070491bafa0dbe16c78a358e806aa7e173d')

build() {
  cd "${srcdir}/HTTP-Daemon-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/HTTP-Daemon-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/HTTP-Daemon-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

