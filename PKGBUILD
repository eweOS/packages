# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
pkgver=3.50.0
_minorpatchver=${pkgver#3.}
_minorver=${_minorpatchver%%.*}
_patchver=${_minorpatchver##*.}
_srcver="$(printf "3%02d%02d00" "$_minorver" "$_patchver")"
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom:Public Domain')
url="https://www.sqlite.org/"
depends=('musl' 'readline' 'zlib')
provides=('sqlite3' 'libsqlite3.so')
options=('!emptydirs')
source=("https://sqlite.org/2025/sqlite-autoconf-$_srcver.tar.gz")
sha256sums=('3bc776a5f243897415f3b80fb74db3236501d45194c75c7f69012e4ec0128327')

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
  make
}

package()
{
  cd sqlite-autoconf-$_srcver
  make DESTDIR="${pkgdir}" install
}
