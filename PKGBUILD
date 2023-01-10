# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=unixodbc
pkgver=2.3.11
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=(x86_64 aarch64)
license=('GPL2' 'LGPL2.1')
url="http://www.unixodbc.org/"
backup=('etc/odbc.ini' 'etc/odbcinst.ini')
depends=('readline')
source=(ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz)
sha256sums=('SKIP')

build()
{
  cd unixODBC-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check()
{
  cd unixODBC-${pkgver}
  make -k check
}

package()
{
  cd unixODBC-${pkgver}
  make DESTDIR="${pkgdir}" install
  touch "$pkgdir"/etc/{odbc,odbcinst}.ini
}
