# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sqlite
pkgver=3.50.4
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
source=("https://sqlite.org/2025/sqlite-autoconf-$_srcver.tar.gz")
sha256sums=('a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18')

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
