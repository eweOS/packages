# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
_srcver=3450300
pkgver=3.45.3
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
depends=('readline' 'zlib')
options=('!emptydirs' 'debug')
source=("https://sqlite.org/2024/sqlite-autoconf-${_srcver}.tar.gz")
sha256sums=('b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531')

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
