# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=perl
pkgver=5.44.0
_baseversion="${pkgver%.*}"
pkgrel=1
pkgdesc="A highly capable, feature-rich programming language"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.perl.org'
license=('GPL' 'PerlArtistic')
depends=('musl' 'libxcrypt')
source=("https://www.cpan.org/src/5.0/perl-${pkgver}.tar.xz")
options=('makeflags' '!purge' 'emptydirs' '!lto')
sha256sums=('505cf43912e9480495c344c70260452e32aa2a73c546a026b3f100053b23ce91')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  export BUILD_ZLIB=False
  export CFLAGS="$CFLAGS -D_GNU_SOURCE"
  export HOSTCFLAGS="$CFLAGS -D_GNU_SOURCE"
  ./configure.gnu \
    -des -Dprefix=/usr \
    -Dvendorprefix=/usr \
    -Dprivlib=/usr/share/perl5/core_perl \
    -Darchlib=/usr/lib/perl5/$_baseversion/core_perl \
    -Dsitelib=/usr/share/perl5/site_perl \
    -Dsitearch=/usr/lib/perl5/$_baseversion/site_perl \
    -Dvendorlib=/usr/share/perl5/vendor_perl \
    -Dvendorarch=/usr/lib/perl5/$_baseversion/vendor_perl \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dinc_version_list=none \
    -Dpager="/bin/less -I" \
    -Dusethreads \
    -Duseshrplib
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Set CPAN default config to use the site directories.
  sed -e '/(makepl_arg =>/   s/""/"INSTALLDIRS=site"/' \
      -e '/(mbuildpl_arg =>/ s/""/"installdirs=site"/' \
      -i "${pkgdir}/usr/share/perl5/core_perl/CPAN/FirstTime.pm"

  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
