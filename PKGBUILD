# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl
pkgver=5.36.0
_baseversion="${pkgver%.*}"
pkgrel=1
pkgdesc="A highly capable, feature-rich programming language"
arch=(x86_64)
license=('GPL' 'PerlArtistic')
depends=('musl' 'libxcrypt')
source=(
  "https://www.cpan.org/src/5.0/perl-${pkgver}.tar.xz"
  "https://github.com/pmqs/Compress-Raw-Zlib/archive/refs/tags/v2.202.tar.gz"
)
options=('makeflags' '!purge' 'emptydirs')
sha256sums=('SKIP' 'SKIP')

prepare() {
  # Replace zlib module to use zlib-ng
  cd $srcdir/$pkgname-$pkgver/cpan
  rm -rf ./Compress-Raw-Zlib
  cp -r "$srcdir/Compress-Raw-Zlib-2.202" ./Compress-Raw-Zlib
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

    export BUILD_ZLIB=False
    CFLAGS="$CFLAGS" ./configure.gnu \
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

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
