# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.0
pkgrel=8
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
  compat-path.patch
  utmp.h
)

sha256sums=('9025d961b8271a0ecc8eeb5786126b6b799376afa6f2bd25c0f872fd24f1123c'
            'cf69f5168c9f8c706915a1f84723e0f6e54ecf892601f20888e08c9cf3d96b52'
            'fd073ce3ab92c5d23b05f5bd735b1858e06dcdc438e227ad09d827565b54891e'
            'fed60c9427ae050679731375ff28195dda1734dcc700c489f0f82d99b03bf18a'
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
