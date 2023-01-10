# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-io-compress-brotli
pkgver=0.004001
pkgrel=1
pkgdesc='Read/write Brotli buffers/streams'
url="https://metacpan.org/release/IO-Compress-Brotli"
arch=(x86_64 aarch64)
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-file-slurper')
source=("https://search.cpan.org/CPAN/authors/id/M/MG/MGV/IO-Compress-Brotli-$pkgver.tar.gz")
sha512sums=('SKIP')

build()
{
  cd IO-Compress-Brotli-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check()
{
  cd IO-Compress-Brotli-$pkgver
  make test
}

package()
{
  cd IO-Compress-Brotli-$pkgver
  make install DESTDIR="$pkgdir"
}
