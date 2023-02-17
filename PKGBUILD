# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.0
pkgrel=8
pkgdesc='An implementation of the utmpx.h family of functions performing user accounting'
arch=(x86_64 aarch64)
url='http://skarnet.org/software/utmps/'
license=(ISC)
depends=(skalibs tty2socket catnest)

source=(
  "http://skarnet.org/software/utmps/utmps-${pkgver}.tar.gz"
  utmpd.service
  wtmpd.service
  utmps.tmpfiles
  compat-path.patch
  utmp.h
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

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
  install -d "${pkgdir}/etc/dinit.d/boot.d"
  install -d "${pkgdir}/etc/rcboot.d"
  install -d "${pkgdir}/etc/tmpfiles.d"
  install "${srcdir}/utmpd.service" "${pkgdir}/etc/dinit.d/utmpd"
  install "${srcdir}/wtmpd.service" "${pkgdir}/etc/dinit.d/wtmpd"
  install -m 0755 "${srcdir}/utmps.tmpfiles" "${pkgdir}/etc/tmpfiles.d/utmps.conf"
  install "${srcdir}/utmp.h" "${pkgdir}/usr/include/utmp.h"

  ln -s ../utmpd "${pkgdir}/etc/dinit.d/boot.d/utmpd"
  ln -s ../wtmpd "${pkgdir}/etc/dinit.d/boot.d/wtmpd"
}
