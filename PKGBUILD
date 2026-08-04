# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
pkgver=3.53.4
_minorpatchver=${pkgver#3.}
_minorver=${_minorpatchver%%.*}
_patchver=${_minorpatchver##*.}
_srcver="$(printf "3%02d%02d00" "$_minorver" "$_patchver")"
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('blessing')
url="https://www.sqlite.org/"
depends=('musl' 'readline' 'zlib')
provides=('sqlite3' 'libsqlite3.so')
options=('!emptydirs')
source=("https://sqlite.org/2026/sqlite-autoconf-$_srcver.tar.gz")
sha256sums=('0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c')

build()
{
  export CFLAGS+=" -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
    -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_RTREE=1"

  # build sqlite
  cd sqlite-autoconf-$_srcver
  ./configure --prefix=/usr \
    --disable-static
  make
}

package()
{
  cd sqlite-autoconf-$_srcver
  make DESTDIR="${pkgdir}" install
  sed -n -e 93,100p sqlite3.c > blessing
  _install_license_ blessing
}
