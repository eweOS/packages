# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tetris
pkgver=7.0.1
pkgrel=1
pkgdesc="Port of OpenBSD tetris for Linux."
arch=(x86_64 aarch64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
makedepends=('bsd-compat-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('12b054a8f0db6258c9ab1693d3464f9feae79bc5d7e6f030aa734e8a7abafb109c2d0eff04fc06360ec93299df567963c0890181ca09fba761f20480952379f3')

build()
{
  cd "$pkgname-$pkgver"
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
