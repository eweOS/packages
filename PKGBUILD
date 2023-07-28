# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=keyutils
pkgver=1.6.1
pkgrel=1
pkgdesc='Linux Key Management Utilities'
arch=(x86_64 aarch64 riscv64)
url='https://www.kernel.org/'
license=('GPL2' 'LGPL2.1')
depends=('musl')
provides=('libkeyutils.so')
backup=('etc/request-key.conf')
source=("https://people.redhat.com/~dhowells/keyutils/keyutils-${pkgver}.tar.bz2")
sha256sums=('c8b15722ae51d95b9ad76cc6d49a4c2cc19b0c60f72f61fb9bf43eea7cbd64ce')

build()
{
  cd ${pkgname}-${pkgver}
  make CFLAGS="${CFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    SBINDIR='/usr/bin' \
    BINDIR='/usr/bin'
}

package()
{
  cd ${pkgname}-${pkgver}
  make NO_ARLIB=1 \
    DESTDIR="${pkgdir}" \
    SBINDIR='/usr/bin' \
    BINDIR='/usr/bin' \
    LIBDIR='/usr/lib' \
    USRLIBDIR='/usr/lib' install
}
