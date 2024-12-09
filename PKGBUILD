# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
_srcver=3470200
pkgver=3.47.2
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
depends=('readline' 'zlib')
provides=('sqlite3' 'libsqlite3.so')
options=('!emptydirs')
source=("https://sqlite.org/2024/sqlite-autoconf-${_srcver}.tar.gz")
sha256sums=('f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b')

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
