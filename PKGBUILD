# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.2
pkgrel=2
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

sha256sums=('f7ffa3714c65973bb95fbcf1501c06fc0478d93a51cea1b373ec6811c2425f52'
	    '77ced4656183e8e3fe4f59adacdbea79f4f620fac3aa8267b5e7a34d1616e395'
	    '94e732ac7fc0855ce05e2dd118c80828938178a1a4d5282f226149d15671e01b'
	    '03b6de41549ab28c8b30e6ed551a4508611bdc7618e8cd9c5816a2b600ff4f9a'
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
