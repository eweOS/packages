# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dropbear
pkgver=2025.87
pkgrel=1
pkgdesc='Lightweight SSH server'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/mkj/dropbear'
license=(MIT)
options=(emptydirs)
depends=(libcrypt.so)
makedepends=(utmps)
_srcdir=${pkgname}-DROPBEAR_${pkgver}
source=(
  https://github.com/mkj/${pkgname}/archive/refs/tags/DROPBEAR_${pkgver}.tar.gz
  dropbear.service
)
sha256sums=('ca32b32280546dfafe474d3976fc80f337cc91f529f05772ea27eafe43a74051'
            '145096d0d66a61b42c656cc555bc256ebae0a71f4558278d4054911e59f57c87')

build()
{
  cd ${_srcdir}
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
