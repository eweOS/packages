# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgname=openpmix
pkgver=5.0.2
pkgrel=1
oac_commit=dfff67569fb72dbf8d73a1dcf74d091dad93f71b
pkgdesc="Extended version of the PMI standard"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/openpmix/openpmix"
license=(BSD)
depends=(curl hwloc jansson libevent zlib curl)
makedepends=(perl python)
provides=(libpmix.so pmix)
backup=(etc/$pkgname/pmix-mca-params.conf)
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/open-mpi/oac/archive/$oac_commit.tar.gz")
sha512sums=('2828c14ed3c41cad6d926e1cbbe5feefe533d319282c44557fbb22afd0235d5655ce44578b58f8b3ecfc59f2eea23690f04eadab5e1f2cd2e2b4dfda09f1aedc'
	    'ea8fcf8bd9ea8b7a2bbe6271942aa921362aebf998a0d5f07e41ec21f2d7d6ed8397899d332355822a305ba2fe3109a97c1c3869ba2c355d9a4331ba1ebcd824')

prepare()
{
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
