# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace
pkgver=5.19
pkgrel=1
pkgdesc='A diagnostic, debugging and instructional userspace tracer'
arch=(x86_64 aarch64)
url='https://strace.io/'
license=(BSD)
depends=(perl)
source=(https://github.com/strace/strace/releases/download/v$pkgver/strace-$pkgver.tar.xz)
sha1sums=('dc34c0d7c3ab0d0adb227f751c016da2c415eb2e')

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
