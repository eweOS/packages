# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
_srcver=3430200
pkgver=3.43.2
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
depends=('readline' 'zlib')
options=('!emptydirs' 'debug')
source=("https://sqlite.org/2023/sqlite-autoconf-${_srcver}.tar.gz")
sha256sums=('6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0')

build()
{
  export CFLAGS+=" -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
    -DSQLITE_ENABLE_FTS3=1"

  # build sqlite
  cd sqlite-autoconf-$_srcver
  ./configure --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package()
{
  cd sqlite-autoconf-$_srcver
  make DESTDIR="${pkgdir}" install
}
