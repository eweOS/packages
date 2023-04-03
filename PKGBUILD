# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dropbear
pkgver=2022.82
pkgrel=2
pkgdesc='Lightweight SSH server'
arch=(x86_64 aarch64)
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
sha256sums=('d22901a79dedca820d73208cc25c9f74c7da7e606984e2cba839181e55a628bc'
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
