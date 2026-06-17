# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tetris
pkgver=7.9.0
pkgrel=1
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
sha512sums=('fabc3569dee760dfb97fc97384cdc225da7ac5b8fb9798ef22f6a8fd6529cdc765da198b127f86df3a59831aabd6aa5fcda859b4dac78a9019b83b75b742aaee'
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
