# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace
pkgver=7.1
pkgrel=1
pkgdesc='A diagnostic, debugging and instructional userspace tracer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://strace.io/'
license=(BSD)
depends=(perl)
makedepends=(linux-headers)
source=(https://github.com/strace/strace/releases/download/v$pkgver/strace-$pkgver.tar.xz)
sha256sums=('81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f')

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --without-libunwind \
    --disable-gcc-Werror \
    --disable-mpers \
    CPPFLAGS="-I/usr/include"
  make
}

check()
{
  # tests do not work in chroot environment. TODO: fixit.
  # make -C $pkgname-$pkgver check
  true
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
