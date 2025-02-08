# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
_srcver=3480000
pkgver=3.49.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
depends=('readline' 'zlib')
provides=('sqlite3' 'libsqlite3.so')
options=('!emptydirs')
source=("https://sqlite.org/2025/sqlite-autoconf-${_srcver}.tar.gz")
sha256sums=('ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5')

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
