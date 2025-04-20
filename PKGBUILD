# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gdbm
pkgver=1.25
pkgrel=1
pkgdesc="GNU database library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL-3.0-or-later)
depends=(readline)
provides=(libgdbm_compat.so libgdbm.so)
# 0001: Backport, add missing include to fix building error
#	https://git.gnu.org.ua/gdbm.git/commit/?id=39ef0347f78ef691c9ad815360198f577043ce4c
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz"
	"0001-Add-missing-include.patch")
sha512sums=('1785598665d7323eed052a55708903c6abaeafcfb66a9ceb69293f57c3fdbf49cd8a821ef23715a40bf7030d0067d1340d12279ed07afe040f912e53078e47f5'
            'f9dc5631b8556f91bb0d419079bb2babeb10c172b1de73136f459d46867ec301de71a92e85e8a45a02d6557772a84b5ef9b521213e7885503284423920b7e540')

prepare()
{
  _patch_ $pkgname-$pkgver

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
