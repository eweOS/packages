# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl
pkgver=5.40.0
_baseversion="${pkgver%.*}"
pkgrel=1
pkgdesc="A highly capable, feature-rich programming language"
arch=(x86_64 aarch64 riscv64)
url='https://www.perl.org'
license=('GPL' 'PerlArtistic')
depends=('musl' 'libxcrypt')
source=("https://www.cpan.org/src/5.0/perl-${pkgver}.tar.xz")
options=('makeflags' '!purge' 'emptydirs' '!lto')
sha256sums=('d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9')

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
