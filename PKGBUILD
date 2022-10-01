# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libtirpc
pkgver=1.3.3
pkgrel=1
pkgdesc="Transport Independent RPC library (SunRPC replacement)"
arch=('x86_64')
url="http://git.linux-nfs.org/?p=steved/libtirpc.git;a=summary"
license=('BSD')
depends=('krb5')
makedepends=('bsd-compat-headers')
backup=('etc/netconfig')
source=(https://downloads.sourceforge.net/sourceforge/libtirpc/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconf=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
