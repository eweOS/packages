# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-io-compress-brotli
pkgver=0.004001
pkgrel=2
pkgdesc='Read/write Brotli buffers/streams'
url="https://metacpan.org/release/IO-Compress-Brotli"
arch=(x86_64 aarch64 riscv64)
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-file-slurper')
source=("https://search.cpan.org/CPAN/authors/id/M/MG/MGV/IO-Compress-Brotli-$pkgver.tar.gz")
sha512sums=('7cc198ecef15c912d8b62e6851935c433159e7f3680f2034949c032d23827f5a5720dd02b77b89b60d43b0a2a7df059c9e76c8f4e44993c28630624f0e17a377')

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
