# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl
pkgver=5.38.2
_baseversion="${pkgver%.*}"
pkgrel=1
pkgdesc="A highly capable, feature-rich programming language"
arch=(x86_64 aarch64 riscv64)
url='https://www.perl.org'
license=('GPL' 'PerlArtistic')
depends=('musl' 'libxcrypt')
source=(
  "https://www.cpan.org/src/5.0/perl-${pkgver}.tar.xz"
  "https://github.com/pmqs/Compress-Raw-Zlib/archive/refs/tags/v2.211.tar.gz"
)
options=('makeflags' '!purge' 'emptydirs' '!lto')
sha256sums=('d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8'
            'ec51c96d1bc202a927aed2f17390a2fe97e991a328f5403edb1c338bb6c0e093')

prepare()
{
  # Replace zlib module to use zlib-ng
  cd $srcdir/$pkgname-$pkgver/cpan
  rm -rf ./Compress-Raw-Zlib
  cp -r "$srcdir/Compress-Raw-Zlib-2.211" ./Compress-Raw-Zlib
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  export BUILD_ZLIB=False
  ./configure.gnu \
    -des -Dprefix=/usr \
    -Dcc="cc -D_GNU_SOURCE" \
    -Dvendorprefix=/usr \
    -Dprivlib="/usr/lib/perl5/${pkgver}" \
    -Darchlib="/usr/lib/perl5/${pkgver}/$(arch)-linux" \
    -Dsitelib="/usr/lib/perl5/site_perl/${pkgver}" \
    -Dvendorlib="/usr/lib/perl5/vendor_perl/${pkgver}" \
    -Dvendorarch="/usr/lib/perl5/vendor_perl/${pkgver}/$(arch)-linux" \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dpager="/bin/less -I" \
    -Dusethreads \
    -Duseshrplib
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
