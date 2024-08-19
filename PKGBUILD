# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tetris
pkgver=7.1.0
pkgrel=1
pkgdesc="Port of OpenBSD tetris for Linux."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
makedepends=('bsd-compat-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('994f3c8c5185de20915fee4875839c4c2347fb7250c4245cd04e990e7e9a526a9a142c0a75b4e8b1291a347e9fc1daca0af8ecc01c5af04c2207dae1fd23ad4c')

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
