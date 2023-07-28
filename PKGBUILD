# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dropbear
pkgver=2022.83
pkgrel=1
pkgdesc='Lightweight SSH server'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/mkj/dropbear'
license=(MIT)
options=(emptydirs)
depends=(libcrypt.so)
makedepends=(utmps)
_srcdir=${pkgname}-DROPBEAR_${pkgver}
source=(
  https://github.com/mkj/${pkgname}/archive/refs/tags/DROPBEAR_${pkgver}.tar.gz
  sshd.service
)
sha256sums=('e02c5c36eb53bfcd3f417c6e40703a50ec790a1a772269ea156a2ccef14998d2'
  '901e31c3f6dc4118e065a9d48f38bfaeb800c7a9456ee2e334e9abc798a63853')

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
  install -d $pkgdir/etc/dinit.d
  install -m 0754 "${srcdir}/sshd.service" $pkgdir/etc/dinit.d/sshd
  install -Dm644 ${_srcdir}/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
