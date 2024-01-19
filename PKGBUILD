# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
_srcver=3450000
pkgver=3.45.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
depends=('readline' 'zlib')
options=('!emptydirs' 'debug')
source=("https://sqlite.org/2024/sqlite-autoconf-${_srcver}.tar.gz")
sha256sums=('72887d57a1d8f89f52be38ef84a6353ce8c3ed55ada7864eb944abd9a495e436')

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
