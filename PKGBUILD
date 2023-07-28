# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgname=openpmix
pkgver=4.2.1
pkgrel=1
pkgdesc="Extended version of the PMI standard"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/openpmix/openpmix"
license=(BSD)
depends=(curl glibc hwloc jansson libevent zlib curl)
makedepends=(perl python)
provides=(libpmix.so pmix)
backup=(etc/$pkgname/pmix-mca-params.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('2c658a1e46093ef4734da35786bffeb562e882cdcdfce5b31f43d810ab17e22d87c0ed30cd25ec20de16b2d11a7b0b1ad9da7ec9136ac87bd8b97fac65d74451')

prepare()
{
  cd $pkgname-$pkgver
  ./autogen.pl
  # busybox doesn't support timeout --preserve-status
  grep -rl 'preserve-status' . | xargs sed -i 's/--preserve-status//g'
}

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/$pkgname \
    --with-curl \
    --with-jansson
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check()
{
  make -k check -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
