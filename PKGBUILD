# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=perl-http-daemon
pkgver=6.17
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
sha256sums=('16281580c40e23108d028434698b5d7d53637bf904c9df822481e253cbec920c')

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

