# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gdbm
pkgver=1.25
pkgrel=1
pkgdesc="GNU database library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL3)
depends=(readline)
provides=(libgdbm_compat.so libgdbm.so)
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz")
sha512sums=('1785598665d7323eed052a55708903c6abaeafcfb66a9ceb69293f57c3fdbf49cd8a821ef23715a40bf7030d0067d1340d12279ed07afe040f912e53078e47f5')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-libgdbm-compat
  make
}

check()
{
  make check -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{NOTE-WARNING,AUTHORS,NEWS,README,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname"
}
