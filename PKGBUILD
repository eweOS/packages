# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.0
pkgrel=9
pkgdesc='An implementation of the utmpx.h family of functions performing user accounting'
arch=(x86_64 aarch64 riscv64)
url='http://skarnet.org/software/utmps/'
license=(ISC)
depends=(skalibs tty2socket catnest)

source=(
  "http://skarnet.org/software/utmps/utmps-${pkgver}.tar.gz"
  utmpd.service
  wtmpd.service
  utmps.tmpfiles
  utmps.sysusers
  compat-path.patch
  utmp.h
)

sha256sums=('9025d961b8271a0ecc8eeb5786126b6b799376afa6f2bd25c0f872fd24f1123c'
            '784f874b49116de99553ace447435b00ceede9b49a14693838777ff3e5595d94'
            'f3bc889b5107e104a3fdfa92907799004354312f08d2408b1c173d44b025860a'
            'fed60c9427ae050679731375ff28195dda1734dcc700c489f0f82d99b03bf18a'
            '51e3ec061e78cb8052a757e3fa2c9cb22c428d4314f8be02f9844d393feab393'
            'b9b885065456df4d54bc68fd96cfdd9111d9cd300f6225a79e5b8cd2afa538aa'
            '3f613b6eb542e7d71012014f1ecbe6d7fbea543e540b69139408c61666e21d3e')

prepare()
{
  cd ${pkgname}-${pkgver}
  # Add more path def to allow build of dinit
  patch -p1 < ${srcdir}/compat-path.patch
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --with-sysdeps=/usr/lib/skalibs/sysdeps \
    --enable-libc-includes \
    --enable-shared
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  _dinit_install_services_ $srcdir/utmpd.service $srcdir/wtmpd.service
  _install_tmpfiles_ $srcdir/utmps.tmpfiles
  _install_sysusers_ $srcdir/utmps.sysusers
  install "${srcdir}/utmp.h" "${pkgdir}/usr/include/utmp.h"
}
