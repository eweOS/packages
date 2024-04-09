# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace
pkgver=6.8
pkgrel=1
pkgdesc='A diagnostic, debugging and instructional userspace tracer'
arch=(x86_64 aarch64 riscv64)
url='https://strace.io/'
license=(BSD)
depends=(perl)
source=(https://github.com/strace/strace/releases/download/v$pkgver/strace-$pkgver.tar.xz)
sha256sums=('ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149')
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
