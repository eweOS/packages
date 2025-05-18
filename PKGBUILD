# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=pmix
pkgname=openpmix
pkgver=5.0.8
pkgrel=1
oac_commit=dfff67569fb72dbf8d73a1dcf74d091dad93f71b
pkgdesc="Extended version of the PMI standard"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/openpmix/openpmix"
license=(BSD)
depends=(curl hwloc jansson libevent zlib curl)
makedepends=(perl python)
checkdepends=(openpmix)
provides=(libpmix.so pmix)
backup=(etc/$pkgname/pmix-mca-params.conf)
options=(!lto)
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/open-mpi/oac/archive/$oac_commit.tar.gz")
sha512sums=('1a6afe069ca44583d237cfaff6ad6ed6425643b432af2da4c199d954dd67c6169a2c68fc628a71d5f6e2c1003a8e251f38e78db0d465156fc93518de23e18fc2'
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
