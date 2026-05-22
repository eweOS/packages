# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tetris
pkgver=7.1.0
pkgrel=4
pkgdesc="Port of OpenBSD tetris for Linux."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
makedepends=('bsd-compat-headers')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "termios-h.patch"
)
sha512sums=('994f3c8c5185de20915fee4875839c4c2347fb7250c4245cd04e990e7e9a526a9a142c0a75b4e8b1291a347e9fc1daca0af8ecc01c5af04c2207dae1fd23ad4c'
            'e4a42584dbd712b03bd4295590b4a8d7e2f9d654dfd0d202add28029ca69982c0836f49ec5117fa758bc3b19466faaf99663ad2a822f8e443bdd54ea664b7f07')

prepare()
{
  # termios-h: add missing termios.h for tcsetattr
  _patch_ "$pkgname-$pkgver"
}

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
