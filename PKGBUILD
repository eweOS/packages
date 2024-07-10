# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>

pkgname=perl-http-message
pkgver=6.46
pkgrel=2
pkgdesc="HTTP style messages"
arch=('any')
url='https://search.cpan.org/dist/HTTP-Message'
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-encode-locale' 'perl-http-date' 'perl-io-html'
	 'perl-lwp-mediatypes' 'perl-uri' 'perl-clone')
checkdepends=('perl-io-compress-brotli' 'perl-test-needs' 'perl-try-tiny')
source=("https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Message-$pkgver.tar.gz")
sha512sums=('86940c54f710cd44497c8ead305fff3922cedd95491eccfbdd6deb96ca57a579c441693d684d92536aa369ad13e87da160ce5b6ec6f2fdd54df03a002a8fd4da')

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
