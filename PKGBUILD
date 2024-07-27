# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libtirpc
pkgver=1.3.5
pkgrel=1
pkgdesc="Transport Independent RPC library (SunRPC replacement)"
arch=(x86_64 aarch64 riscv64)
url="http://git.linux-nfs.org/?p=steved/libtirpc.git;a=summary"
license=('BSD-3-Clause')
depends=('krb5')
makedepends=('bsd-compat-headers' 'linux-headers')
backup=('etc/netconfig')
provides=('libtirpc.so')
source=("https://downloads.sourceforge.net/sourceforge/libtirpc/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconf=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
