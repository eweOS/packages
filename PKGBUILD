# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.3
pkgrel=3
pkgdesc='An implementation of the utmpx.h family of functions performing user accounting'
arch=(x86_64 aarch64 riscv64 loongarch64)
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

sha256sums=('318ac799ed17c3fbf4281085b4b071facbd35c29852a5c643c24fa2869fc0545'
            '782e17440a73740544d9cad00d92f3c0086f8120877e8e9784150646a30af634'
            '8173e36280678a99a1545ad73e900cbf11c475b1f76ca74a43a1a90acfd13626'
            'cd4e9a446d0b6926603b8831dc5e29d2b9a652e11b865be5cf8e877d6adde745'
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
