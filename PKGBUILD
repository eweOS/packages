# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=robotfindskitten
pkgver=3.0000000.726
pkgrel=1
pkgdesc='Yet another Zen simulation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://robotfindskitten.org/'
license=(GPL-2.0-or-later)
depends=(ncurses hicolor-icon-theme)
makedepends=(autoconf)
source=("https://codeberg.org/robotfindskitten/robotfindskitten/releases/download/$pkgver/robotfindskitten-$pkgver.tar.gz")
sha512sums=('0822dd923714baa7aa3b7a6b5c5bbe8f9941b953cf3223d8cdef55a7e054984eed9dd007fa50555b90f9d51bbf5e4409e0a27e388479bb76e306eb8af4f86d14')

prepare()
{
  cd "$pkgname-$pkgver"
  # Install the executable in /usr/bin so the desktop entry can find it on PATH.
  sed -i 's/execgamesdir = $(prefix)\/games/execgamesdir = $(prefix)\/bin/' src/Makefile.am
  autoreconf -fiv
}

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ "$srcdir/$pkgname-$pkgver/COPYING"
}
