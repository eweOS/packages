# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dropbear
pkgver=2026.92
pkgrel=1
pkgdesc='Lightweight SSH server'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/mkj/dropbear'
license=(MIT)
options=(emptydirs)
depends=(musl utmps libcrypt.so)
_srcdir=${pkgname}-DROPBEAR_${pkgver}
source=(
  https://github.com/mkj/${pkgname}/archive/refs/tags/DROPBEAR_${pkgver}.tar.gz
  dropbear.service
)
sha256sums=('61aa9d48b85de64fec33feb3e2a5d9a98e371a6f0b62f33ee8fc6aced838b7bc'
            '145096d0d66a61b42c656cc555bc256ebae0a71f4558278d4054911e59f57c87')

build()
{
  cd ${_srcdir}
  LDFLAGS="$LDFLAGS -Wl,--push-state -Wl,--as-needed -lutmps -Wl,--pop-state"
  ./configure \
    --bindir=/usr/bin \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-utmp \
    --disable-wtmp \
    --enable-utmpx \
    --enable-wtmpx
  make \
    PROGRAMS='dbclient dropbear dropbearconvert dropbearkey scp'
}

package()
{
  install -d "$pkgdir/etc/$pkgname"
  make -C ${_srcdir} install DESTDIR="$pkgdir" \
    PROGRAMS='dbclient dropbear dropbearconvert dropbearkey scp'
  _dinit_install_services_ dropbear.service
  mv "$pkgdir/usr/bin/"{scp,dbscp}
  install -Dm644 ${_srcdir}/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
