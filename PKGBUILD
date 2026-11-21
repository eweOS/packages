# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgname=openpmix
pkgver=6.1.0
pkgrel=1
oac_commit=3064f7bd191b49a5a5554170ef7be4762246b5ee
pkgdesc="Extended version of the PMI standard"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/openpmix/openpmix"
license=(BSD-3-Clause)
depends=(curl hwloc jansson libevent zlib)
makedepends=(perl python)
provides=(libpmix.so pmix)
backup=(etc/$pkgname/pmix-mca-params.conf)
options=(!lto)
# 0001: Backport, always set up IOF sinks so non-gateway servers do not crash
# https://github.com/openpmix/openpmix/commit/fe4b763bfd96521beaf2848406efa08108ffd49e
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/open-mpi/oac/archive/$oac_commit.tar.gz"
	"0001-pmix-server-always-setup-iof-sinks.patch")
sha512sums=('7821f5e099e27c286da0091332dc0fa23ab453fec258d6aabf339391968601a28f9bee36505b4130ba1053c3486e81ff3b79b590aa0b102cad977a39edc56a8a'
            'a33b249547d4d0ee688d5311f2a0f55bf032bc3c4b0cbbefe7851db7e48cfba34c0efc68e148338fc374ed0ad3c5873f5cc4cf7c51593419b2612994ac90e9eb'
            '1e909deb4baee1f0ac95a47f6ed536e44966686ef2659d8568a2e5447cec103f033c09a34ac28a44a775138bb4f4809aec4a23a4125302be8d0e0c3d3ffb0586')

prepare()
{
  _patch_ "$pkgname-$pkgver"
  cd $pkgname-$pkgver
  cp $srcdir/oac-$oac_commit/* config/oac/
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
