# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=unixodbc
pkgver=2.3.14
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-onl' 'LGPL-2.1-or-later')
url="http://www.unixodbc.org/"
backup=('etc/odbc.ini' 'etc/odbcinst.ini')
depends=('musl' 'readline')
source=("https://www.unixodbc.org/unixODBC-$pkgver.tar.gz")
sha256sums=('4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771')

prepare() {
  cd unixODBC-${pkgver}
  cp /usr/share/autoconf/build-aux/config.{guess,sub} .
}

build() {
  cd unixODBC-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd unixODBC-${pkgver}
  make -k check
}

package() {
  cd unixODBC-${pkgver}
  make DESTDIR="${pkgdir}" install
  touch "$pkgdir"/etc/{odbc,odbcinst}.ini
}
