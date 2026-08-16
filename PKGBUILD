# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>

pkgname=perl-http-message
pkgver=7.04
pkgrel=1
pkgdesc="HTTP style messages"
arch=('any')
url='https://search.cpan.org/dist/HTTP-Message'
license=('PerlArtistic' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl' 'perl-encode-locale' 'perl-http-date' 'perl-io-html'
	 'perl-lwp-mediatypes' 'perl-uri' 'perl-clone')
checkdepends=('perl-io-compress-brotli' 'perl-test-needs' 'perl-try-tiny')
source=("https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Message-$pkgver.tar.gz")
sha512sums=('36e0f2a3819bcba799fa3cd424266c5667af943adf6e3dae2bff0f6cdb3b63a9bda47ac627e1fe3f4da2adb8f9f090dd0a1c810ceb340e842221a07d18159f14')

build() {
  cd HTTP-Message-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTTP-Message-$pkgver
  make test
}

package() {
  cd HTTP-Message-$pkgver
  make DESTDIR="$pkgdir" install
}
